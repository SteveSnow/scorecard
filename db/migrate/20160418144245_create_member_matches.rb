class CreateMemberMatches < ActiveRecord::Migration
  def change
    create_table :member_matches do |t|
      t.integer :member_id
      t.integer :match_id

      t.timestamps null: false
    end
  end
end
