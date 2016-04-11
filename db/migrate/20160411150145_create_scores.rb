class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :strokes
      t.integer :hole_id
      t.datetime :date
      t.integer :member_id
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
