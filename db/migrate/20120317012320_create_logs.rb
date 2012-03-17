class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :tsession
      t.integer :set
      t.integer :repetition
      t.integer :value

      t.timestamps
    end
    add_index :logs, :tsession_id
  end
end
