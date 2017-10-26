class CreateUserFollows < ActiveRecord::Migration
  def change
    create_table :user_follows do |t|
      t.integer      :user_id
      t.integer      :followed_id
    end
  end
end
