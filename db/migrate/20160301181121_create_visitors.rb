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

      t.timestamps null: false
    end
  end
end
