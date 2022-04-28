class Crypto < ApplicationRecord
  has_many :holdings
  has_many :watchlists
  has_many :histories, dependent: :destroy
  validates :name, presence: true
  validates :abbreviation, presence: true
end
