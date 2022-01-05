class UpdateColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :seeker, :string
  end
end
