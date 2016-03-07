class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :visitor_id
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
