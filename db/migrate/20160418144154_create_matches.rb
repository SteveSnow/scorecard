class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.boolean :private
      t.integer :scorer_id
      t.string :track

      t.timestamps null: false
    end
  end
end
