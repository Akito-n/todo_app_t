class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user
      t.references :task
      t.integer :term
      t.integer :read
      t.timestamps
    end
  end
end
