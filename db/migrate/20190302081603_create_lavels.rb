class CreateLavels < ActiveRecord::Migration[5.2]
  def change
    create_table :lavels do |t|
      t.string :body, null: false
      t.timestamps
    end
  end
end
