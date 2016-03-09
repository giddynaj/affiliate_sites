class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :uri
      t.string :ip
      t.string :user_agent
      t.string :referer
      t.datetime :created_at
      t.integer :context_id
      t.string :client
      t.integer :client_version_id
      t.integer :client_id
      t.timestamps null: false
    end
  end
end
