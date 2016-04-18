class AddMatchColumnToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :match_id, :integer
  end
end
