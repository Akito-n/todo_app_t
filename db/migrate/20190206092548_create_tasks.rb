class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title #タスクタイトル
      t.text :description #タスク詳細説明
      t.timestamps
    end
  end
end
