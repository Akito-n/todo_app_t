class AddColumnPriorityToTask < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :priority, :integer, null: false, default: 0
  end

  def down
    remove_column :tasks, :priority, :integer
  end
end
