class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, null: false, limit: 100
      t.references :brewery, index: true, null: false
    end
    add_index :brands, [:name, :brewery_id], unique: true
  end
end
