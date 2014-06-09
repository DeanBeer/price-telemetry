class CreatePriceData < ActiveRecord::Migration
  def change
    create_table :price_data do |t|
      t.references :brand, index: true, null: false
      t.date :date, null: false
      t.references :retailer, index: true, null: false
      t.boolean :on_special, null: false, default: false
      t.references :packaging, index: true, null: false
      t.money :price, null: false
      t.timestamps
    end
  end
end
