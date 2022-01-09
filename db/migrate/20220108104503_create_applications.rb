class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.references :listing, index: true, foreign_key: true
      t.integer :applied_user 
      t.timestamps
    end
  end
end
