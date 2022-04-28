class AddPriceToCryptos < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :price, :string
  end
end
