class AddEdittoUsers < ActiveRecord::Migration
  def change
    add_column :users, :position, :string
    add_column :users, :s_introducution, :text
  end
end
