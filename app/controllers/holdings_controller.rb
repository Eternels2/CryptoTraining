class HoldingsController < ApplicationController
  def index # people can see which token they bought, with chart and indicator, balance wallet
    @crypto = Crypto.find(params[:crypto_id])
    @holding = Holding.new
  end

  def create
    @holding = Holding.where(crypto_id: params[:crypto_id]).first
    @holding = Holding.new(holding_params) if @holding.nil?
    @crypto = Crypto.find(params[:crypto_id])
    @history = History.new

    if params[:commit] == "Buy"
      time = Time.new
      #calculate price
      quantity = params[:holding]["quantity"].to_f
      price = @crypto.price.to_f
      if current_user.amount < ((quantity * 100) * price / 100).round(2)
        redirect_to crypto_path(@crypto), notice: "Not enough money !"
        return
        #format.html { redirect_to request.referer, alert: 'Not enough money' }
      end
      current_user.amount -= ((quantity * 100) * price / 100).round(2)
      current_user.save
      if @holding.quantity.nil? == false
        @holding.quantity += quantity
        @holding.purchased_price = price
      else # first time creating holding
        @holding.quantity = quantity
        @holding.purchased_price = price
      end
      @holding.user = current_user
      @holding.crypto = @crypto
      @history.date = time.strftime("%Y-%m-%d %H:%M:%S")
      @history.price = price
      @history.crypto = @crypto
      @history.save!
      redirect_to dashboard_path if @holding.save!
    elsif params[:commit] == "Sell"
      quantity = params[:holding]["quantity"].to_f
      price = @crypto.price.to_f
      current_user.amount += ((quantity * 100) * price / 100).round(2)
      current_user.save
      @holding.user = current_user
      @holding.crypto = @crypto
      if (@holding.quantity - quantity) > 0.00000000000
        @holding.quantity -= quantity
        if @holding.save
          redirect_to dashboard_path
        end
      else
        @holding.destroy
        redirect_to dashboard_path
      end
    elsif params[:commit] == "Add Watchlist"
      @watchlist = Watchlist.new(holding_params)
      @watchlist.crypto = Crypto.find(params[:crypto_id])
      @watchlist.user = current_user
      @watchlist.save!
      redirect_to "/watchlists"
    end
  end

  def dashboard
  end

  def user_holdings
    if current_user
      holdings = Holding.where(user_id: current_user.id)
      render :json => holdings
    end
  end

  private

  def holding_params
    params.require(:holding).permit(:crypto_id)
  end
end
