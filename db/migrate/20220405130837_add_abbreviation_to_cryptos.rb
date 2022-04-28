class AddAbbreviationToCryptos < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :abbreviation, :string
  end
end
