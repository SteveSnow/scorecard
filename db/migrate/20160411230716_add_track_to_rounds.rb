class AddTrackToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :track, :string
  end
end
