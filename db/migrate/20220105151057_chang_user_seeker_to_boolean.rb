class ChangUserSeekerToBoolean < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :account_seeker, :boolean
  end
end
