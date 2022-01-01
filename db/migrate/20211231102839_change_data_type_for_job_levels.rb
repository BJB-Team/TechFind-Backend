class ChangeDataTypeForJobLevels < ActiveRecord::Migration[6.1]
  def change
    rename_column :job_levels, :title, :name
  end
end
