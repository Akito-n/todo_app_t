class AddDefaultReafToNotification < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications, :read, :integer, :default => 0
  end
end
