class CreateRecordsOfWork < ActiveRecord::Migration[7.1]
  def change
    create_table :record_of_works do |t|
      t.integer :hours
      t.belongs_to :report
      t.belongs_to :employee

      t.timestamps
    end

  end
end
