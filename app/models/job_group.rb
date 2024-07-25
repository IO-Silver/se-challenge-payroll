class JobGroup < ApplicationRecord
  has_many :employees
  validates :name, presence: true, uniqueness: true
  validates :rate, presence: true
  # TODO: Make sure to validate for positive hourly rates
end
