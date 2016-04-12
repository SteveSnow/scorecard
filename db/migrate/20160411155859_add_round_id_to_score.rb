class AddRoundIdToScore < ActiveRecord::Migration
  def change
      add_column :scores, :round_id, :integer
  end
end
