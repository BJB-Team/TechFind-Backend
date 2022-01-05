class FixUserSeeker < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :seeker
    add_column :users, :account_seeker, :boolean
  end
end
