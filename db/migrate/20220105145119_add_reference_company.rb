class AddReferenceCompany < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :user, index: true
    add_foreign_key :companies, :users
  end
end
