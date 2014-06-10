class CreatePackagings < ActiveRecord::Migration
  def change
    create_table :packagings do |t|
      t.string :material, null: false, limit: 20
      t.string :name, index: { unique: true }, limit: 30
      t.integer :quantity, null: false
      t.string :volume, null: false, limit: 500
    end
    add_index :packagings, [:material, :quantity, :volume], unique: true
  end
end
