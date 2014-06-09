class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name, null: false, index: { unique: true }
      t.references :route, index: true
    end
  end
end
