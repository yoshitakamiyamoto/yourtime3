class AddColumnPosts < ActiveRecord::Migration
  def change
   add_column :posts, :created_at, :datetime
   add_column :posts, :updated_at, :datetime
   remove_column :posts, :created, :string
   remove_column :posts, :datetime, :datetime
  end
end
