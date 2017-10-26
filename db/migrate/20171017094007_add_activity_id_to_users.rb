class AddActivityIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activity_id, :integer
  end
end
