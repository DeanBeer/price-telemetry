class CreatePackagings < ActiveRecord::Migration
  def change
    create_table :packagings do |t|
      t.string :name, index: { unique: true }
      t.integer :quantity, null: false
      t.integer :volume, null: false
    end
  end
end
