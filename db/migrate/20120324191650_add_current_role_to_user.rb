class AddCurrentRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :as_coach, :boolean
  end
end
