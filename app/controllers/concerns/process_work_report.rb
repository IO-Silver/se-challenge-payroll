module ProcessWorkReport
  require 'csv'

  def self.process_report(report, file)
    begin
      work_report = CSV.parse(file.open, headers: true)
      work_report.each do |row|
        employee = Employee.find_or_create_by!(
          id:           row['employee id'].to_i,
          job_group_id: row['job group']
        )

        # Create the work record
        RecordOfWork.create!(
          date:     row['date'],
          hours:    row['hours worked'],
          employee: employee,
          report:   report
        )
      end
    rescue StandardError => e
      puts  e.message
      throw e
    end
  end

end