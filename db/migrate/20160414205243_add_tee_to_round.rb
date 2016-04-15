class AddTeeToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :tee, :string
  end
end
