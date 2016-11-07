class CreateStaffMemberOptions < ActiveRecord::Migration
  def change
    create_table :staff_member_options do |t|
      t.string :name, null:false
      t.string :question, null:false
      t.string :option
      t.integer :bet
      t.boolean :correct, default:false
    end
  end
end
