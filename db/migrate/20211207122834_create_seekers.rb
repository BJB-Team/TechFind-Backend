class CreateSeekers < ActiveRecord::Migration[6.1]
  def change
    create_table :seekers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
