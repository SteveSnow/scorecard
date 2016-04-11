class CreateHoles < ActiveRecord::Migration
  def change
    drop_table :holes
    create_table :holes do |t|
      t.string :name
      t.integer :yardage_id
      t.integer :par

      t.timestamps null: false
    end
  end
end
