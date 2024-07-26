class RecordOfWork < ApplicationRecord
  belongs_to :report
  belongs_to :employee
  after_create :set_pay_period

  def set_pay_period
    if date <= date.beginning_of_month + 14.days
      self.pay_period_start = date.beginning_of_month
      self.pay_period_end   = date.beginning_of_month + 14.days
    else
      self.pay_period_start = date.beginning_of_month + 15.days
      self.pay_period_end   = date.end_of_month
    end

    save!
  end
end
