class AddListingUserIdToApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :listing_user_id, :integer
  end
end
