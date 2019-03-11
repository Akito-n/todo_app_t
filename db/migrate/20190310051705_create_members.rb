class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :group, null: false
      t.integer :role, null: false, default: 1
      t.timestamps
    end
  end
end
