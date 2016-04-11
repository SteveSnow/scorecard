class AddGreensAndFairwaysToScore < ActiveRecord::Migration
  def change
    add_column :scores, :gir, :boolean
    add_column :scores, :fairway, :boolean
    add_column :scores, :putts, :integer
  end
end
