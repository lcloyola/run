class AddCoachToUser < ActiveRecord::Migration
  def change
    add_column :users, :coach, :boolean, :default => true
  end
end
