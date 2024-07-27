class CreateRecordsOfWork < ActiveRecord::Migration[7.1]
  def change
    create_table :records_of_work do |t|
      t.float :hours
      t.date :date
      t.date :pay_period_start
      t.date :pay_period_end
      t.belongs_to :report
      t.belongs_to :employee

      t.timestamps
    end

  end
end
