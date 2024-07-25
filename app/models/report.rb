class Report < ApplicationRecord
  validates :filename, presence: true, uniqueness: true
end
