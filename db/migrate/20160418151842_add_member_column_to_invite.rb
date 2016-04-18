class AddMemberColumnToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :member_id, :integer
    remove_column :invites, :to, :integer
  end
end
