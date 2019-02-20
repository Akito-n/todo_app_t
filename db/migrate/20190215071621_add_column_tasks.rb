class AddColumnTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :due_date, :date
  end

  def down
    remove_column :tasks, :due_date, :date
  end

end
