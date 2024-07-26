class Employee < ApplicationRecord
  belongs_to :job_group
  has_many :records_of_work
end
