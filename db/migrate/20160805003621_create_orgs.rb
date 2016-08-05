class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :name, null: false
      t.string :domain, null: false

      t.timestamps null: false
    end

    add_index :orgs, :name
    add_index :orgs, :domain
  end
end
