class CreateYardages < ActiveRecord::Migration
  def change
    create_table :yardages do |t|
      t.integer :black
      t.integer :blue
      t.integer :white
      t.integer :red
      t.integer :gold
      t.integer :hole_id

      t.timestamps null: false
    end
  end
end
