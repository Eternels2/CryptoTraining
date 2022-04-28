class AddImageUrlToCryptos < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :image_url, :string
  end
end
