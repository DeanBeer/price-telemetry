class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name, null: false, index: { unique: true }, limit: 50
    end
  end
end

