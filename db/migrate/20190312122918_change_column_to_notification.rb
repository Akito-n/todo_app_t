class ChangeColumnToNotification < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :group, foreign_key: true, null: false
    remove_reference :notifications, :user
  end
end
