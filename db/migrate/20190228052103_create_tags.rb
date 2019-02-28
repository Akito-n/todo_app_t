class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :body, null: false, default: ''

      t.timestamps
    end
  end
end
