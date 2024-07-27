class CreateJobGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :job_groups, id: false do |t|
      t.string :name, null: false, primary_key: true
      t.integer :rate

      t.timestamps
    end
  end
end
