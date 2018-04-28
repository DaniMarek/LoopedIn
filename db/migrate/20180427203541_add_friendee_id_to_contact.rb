class AddFriendeeIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :friendee_id, :integer
  end
end
