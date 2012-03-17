class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :trainingday
      t.references :template
      t.references :user
      t.text :comments

      t.timestamps
    end
    add_index :sessions, :template_id
    add_index :sessions, :user_id
  end
end
