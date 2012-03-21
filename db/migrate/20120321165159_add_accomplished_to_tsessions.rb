class AddAccomplishedToTsessions < ActiveRecord::Migration
  def change
    add_column :tsessions, :is_done, :boolean, :default => false
  end
end
