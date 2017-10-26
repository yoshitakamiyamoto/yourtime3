class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    t.integer    :user_id
    t.integer    :available_time
    t.integer    :used_time
    t.text       :comment
    t.text       :created
    t.datetime   :datetime
    t.integer    :activity_id
    end
  end
end
