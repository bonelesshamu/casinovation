class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :name, null: false
      t.integer :coin, null: false
      t.string :prize, default: ""
      t.boolean :acquirer, default: false
    end
  end
end
