class DownColumnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mail, :string
    remove_column :users, :password, :string
    remove_column :users, :activity, :string
  end
end
