class AddChartToCoins < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :chart_url, :string
  end
end
