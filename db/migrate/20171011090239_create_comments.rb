class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    t.string       :value
    t.integer      :report_id
    t.text         :created
    t.text         :modified
    end
  end
end
