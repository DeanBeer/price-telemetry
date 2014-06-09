class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name, null: false
    end
    add_index :breweries, :name, unique: true
  end
end
