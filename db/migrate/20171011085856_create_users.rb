class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string     :name
      t.string     :mail
      t.string     :password
      t.text       :profile_image
    end
  end
end
