class CreatePackagings < ActiveRecord::Migration
  def change
    create_table :packagings do |t|
      t.string :material, null: false, limit: 20
      t.string :name, index: { unique: true }, limit: 30
      t.integer :quantity, null: false
      t.integer :volume_scalar, null: false
      t.string :volume_units, null: false, limit: 20
    end
    add_index :packagings, [:material, :quantity, :volume_scalar, :volume_units], unique: true, name: 'unique_material_quantity_volume'
  end
end
