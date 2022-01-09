class ChangeAccountSeekerToString < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :account_seeker, :string
  end
end
