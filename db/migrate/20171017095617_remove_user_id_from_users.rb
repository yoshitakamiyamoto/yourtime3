class RemoveUserIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :user_id, :integer
    remove_column :users, :activity_id, :integer
  end
end
