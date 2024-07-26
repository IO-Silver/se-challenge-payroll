class Report < ApplicationRecord
  has_many :records_of_work
  validates :filename, presence: true, uniqueness: true
  validates :filename, format: { with: /\Atime-report-\d+\z/ }
end
