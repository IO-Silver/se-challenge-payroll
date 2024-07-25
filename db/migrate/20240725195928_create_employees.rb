class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.belongs_to :job_group

      t.timestamps
    end

    add_index :employees, :id, unique: true
  end
end
