class AddGeckoId < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :coingecko_id, :string
  end
end
