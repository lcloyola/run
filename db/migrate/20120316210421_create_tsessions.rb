class CreateTsessions < ActiveRecord::Migration
  def change
    create_table :tsessions do |t|
      t.date :trainingday
      t.references :template
      t.references :user
      t.text :comments

      t.timestamps
    end
    add_index :tsessions, :template_id
    add_index :tsessions, :user_id
  end
end
