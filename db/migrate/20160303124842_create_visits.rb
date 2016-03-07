class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :visitor_id
      t.integer :stage_id
      t.datetime :datetime_ts

      t.timestamps null: false
    end
  end
end
