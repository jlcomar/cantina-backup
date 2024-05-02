class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :customer, null: false, foreign_key: true
      t.json :cart
      t.decimal :total_price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
