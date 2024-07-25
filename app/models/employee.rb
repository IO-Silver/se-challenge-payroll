class Employee < ApplicationRecord
  belongs_to :job_group
  has_many :record_of_works
end
