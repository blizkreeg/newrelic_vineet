class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :ts, null: false
      t.string :name, null: false
      t.string :hostname, null: false
      t.integer :org_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :events, :orgs

    add_index :events, :hostname
    add_index :events, :ts
    add_index :events, :org_id
  end
end
