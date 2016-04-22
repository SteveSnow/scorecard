class AddCurrentHoleToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :current_hole, :integer
  end
end
