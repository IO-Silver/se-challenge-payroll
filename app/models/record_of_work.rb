class RecordOfWork < ApplicationRecord
  belongs_to :report
  belongs_to :employee
  after_save :set_pay_period

  def set_pay_period

  end
end
