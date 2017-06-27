class Location < ApplicationRecord
  belongs_to :response
  has_many :response_languages 
end
