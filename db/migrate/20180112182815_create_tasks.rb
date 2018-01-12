class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :text
      t.boolean :status
      t.integer :user_id
      t.integer :progect_id

      t.timestamps
    end
  end
end
