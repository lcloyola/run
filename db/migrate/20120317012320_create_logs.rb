class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :session
      t.integer :set
      t.integer :repetition
      t.integer :value

      t.timestamps
    end
    add_index :logs, :session_id
  end
end
