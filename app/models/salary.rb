class Salary < ApplicationRecord
  validates_uniqueness_of :name
  has_many :response_salaries
  has_many :responses, through: :response_salaries
end
