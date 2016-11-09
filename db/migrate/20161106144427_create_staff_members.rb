class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :name, null: false
      t.integer :coin, null: false
      t.integer :prize1_bet
      t.boolean :prize1_winner, default: false
      t.integer :prize2_bet
      t.boolean :prize2_winner, default: false
      t.integer :prize3_bet
      t.boolean :prize3_winner, default: false
      t.integer :prize4_bet
      t.boolean :prize4_winner, default: false
      t.integer :prize5_bet
      t.boolean :prize5_winner, default: false
      t.boolean :prize_bet_flag, default: false
    end
  end
end
