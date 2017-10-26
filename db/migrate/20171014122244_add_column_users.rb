class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :activity, :string
    add_column :users, :user_id,  :integer
  end
end
