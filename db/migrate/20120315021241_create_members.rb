class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :team
      t.references :user

      t.timestamps
    end
    add_index :members, :team_id
    add_index :members, :user_id
  end
end
