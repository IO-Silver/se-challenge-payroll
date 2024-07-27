module Serializers::RecordOfWorkSerializer
# {
#   "payrollReport": {
#     "employeeReports": [
#       {
#         "employeeId": "1",
#         "payPeriod": {
#           "startDate": "2023-01-01",
#           "endDate": "2023-01-15"
#         },
#         "amountPaid": "$300.00"
#       },
#       {
#         "employeeId": "1",
#         "payPeriod": {
#           "startDate": "2023-01-16",
#           "endDate": "2023-01-31"
#         },
#         "amountPaid": "$80.00"
#       },
#       {
#         "employeeId": "2",
#         "payPeriod": {
#           "startDate": "2023-01-16",
#           "endDate": "2023-01-31"
#         },
#         "amountPaid": "$90.00"
#       }
#     ]
#   }
# }
  def self.serialize
    employee_reports  = []
    # TODO: Sorting can be done more efficiently here
    Employee.all.sort.each do |employee|
      RecordOfWork.where(employee_id: employee.id)
                  .order(date: :asc)
                  .group_by(&:pay_period_start).each do |pay_start, rows|
        employee_report = {
          employeeId: employee.id.to_s,
          payPeriod: {
            startDate: pay_start.to_s,
            # TODO: Find an equally elegant way to set the endDate
            endDate: rows.first.pay_period_end.to_s
          },
          amountPaid: "$#{'%.2f' % (employee.job_group.rate * rows.map(&:hours).inject(0, :+))}"
        }

        employee_reports << employee_report
      end
    end

    return { payrollReport: { employeeReports: employee_reports }}
  end
end