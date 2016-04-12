class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
