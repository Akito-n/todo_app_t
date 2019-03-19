class AddcolumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :row, :integer
  end
end
