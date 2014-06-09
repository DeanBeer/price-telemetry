class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name, null: false, index: { unique: true }
    end
  end
end

