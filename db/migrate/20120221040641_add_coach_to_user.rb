class AddCoachToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_coach, :boolean, :default => true
    add_column :users, :is_athlete, :boolean, :default => false
    add_column :users, :coach_id, :integer
  end
end
