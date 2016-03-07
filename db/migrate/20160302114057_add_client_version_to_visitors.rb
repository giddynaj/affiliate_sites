class AddClientVersionToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :client_version_id, :integer
  end
end
