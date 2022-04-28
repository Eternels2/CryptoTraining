class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # landing page
  def home
    # @hide_navbar = true
    if current_user.nil? == true
      redirect_to "/users/sign_in"
    end
    @cryptos = Crypto.all
  end

  # People discover all basic of crypto, and learning the basis
  def index
    @tab = params[:tab].to_i
  end

  # people discovers all the ways to create a wallet, and wich platform to choose
  def wallet
  end

  # people, can see all the keywords of trading world
  def keyword
  end

  private

  def find_crypto # people can buy/find a crypto with their fictive wallet
    @crypto = Crypto.find(params[:id])
  end
end
