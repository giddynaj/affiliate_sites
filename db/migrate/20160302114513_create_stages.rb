class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :name
      t.integer :client_id
      t.integer :client_version_id
      t.string :layout_name
    end
  end
end
