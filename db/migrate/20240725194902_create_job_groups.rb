class CreateJobGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :job_groups do |t|
      t.integer :rate
      t.string :name, :primary_key

      t.timestamps
    end
  end
end
