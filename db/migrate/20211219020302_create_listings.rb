class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.references :user, index: true, foreign_key: true
      t.references :job_type, index: true, foreign_key: true
      t.references :job_level, index: true, foreign_key: true
      t.timestamps
    end
  end
end
