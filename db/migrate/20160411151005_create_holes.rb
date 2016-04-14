class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.string :name
      t.integer :yardage_id
      t.integer :par

      t.timestamps null: false
    end
  end
end
