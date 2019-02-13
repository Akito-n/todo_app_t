class ChangeColumnToTask < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :title, :string, null: false
    change_column :tasks, :description, :text, default: ''
  end

  def down
    change_column :tasks, :title, :string
    change_column :tasks, :description, :text
  end

end
