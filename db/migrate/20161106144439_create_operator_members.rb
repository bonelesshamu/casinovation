class CreateOperatorMembers < ActiveRecord::Migration
  def change
    create_table :operator_members do |t|

      t.timestamps null: false
    end
  end
end
