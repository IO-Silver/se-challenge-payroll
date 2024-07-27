class Report < ApplicationRecord
  has_many :records_of_work
  validates :filename, presence: true, uniqueness: true
  validates :filename, format: { with: /\Atime-report-\d+\.csv\z/ }

  # TODO: Store the actual files in a Cloud solution, like Cloudinary
end
