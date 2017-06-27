class ResponseLanguage < ApplicationRecord
  belongs_to :response
  belongs_to :language
  belongs_to :location
end
