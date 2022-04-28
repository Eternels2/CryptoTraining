class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :set_simulation_date
  has_many :holdings, dependent: :destroy
  has_many :watchlists, dependent: :destroy
  has_many :cryptos, through: :holdings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def set_simulation_date
 # a completer
 end
end
