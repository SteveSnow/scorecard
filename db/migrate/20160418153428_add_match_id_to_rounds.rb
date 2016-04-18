class AddMatchIdToRounds < ActiveRecord::Migration
  def change
      add_column :rounds, :match_id, :integer
  end
end
