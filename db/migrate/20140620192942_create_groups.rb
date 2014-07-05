class CreateGroups < ActiveRecord::Migration
  def change

    create_table :groups do |t|
      t.string :name, null: false, index: { unique: true }, limit: 40
    end

    create_table :group_memberships do |t|
      t.references :member, polymorphic: true, null: false, index: true
      t.references :group, null: false
      t.string :label, limit: 40
    end

  end
end
