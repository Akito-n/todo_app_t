class CreateTaskLavels < ActiveRecord::Migration[5.2]
  def change
    create_table :task_lavels do |t|
      t.references :task
      t.references :lavel

      t.timestamps
    end
  end
end
