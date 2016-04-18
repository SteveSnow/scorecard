class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :to
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
