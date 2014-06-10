class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name, null: false, index: { unique: true }, limit: 100
      t.references :route, index: true
    end
  end
end
