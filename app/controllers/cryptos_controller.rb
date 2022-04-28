require 'json'
require 'rest-client'

class CryptosController < ApplicationController
  before_action :find_crypto, only: :show
  def index # people can see top ten token charts and the indicator we provide, to sell/buy/wait
    @cryptos = Crypto.all
  end

  def show # people can see detailed chart of token, with elapsed time of their choice
    @holding = Holding.new
    @watchlist = Watchlist.new
    @holdings = Holding.where(user_id: current_user)
  end

  def find
    if current_user
      crypto = Crypto.find(params[:id])
      render :json => crypto
    end
  end

  private

  def find_crypto # people can buy/find a crypto with their fictive wallet
    @crypto = Crypto.find(params[:id])
  end
end
