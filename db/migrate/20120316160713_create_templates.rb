class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :unit
      t.integer :sets
      t.integer :reps
      t.integer :interval
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :templates, :user_id
    add_index :templates, :category_id
  end
end
