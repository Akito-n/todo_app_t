class RenameDuedateColumnToTask < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :due_date, :term
  end
end
