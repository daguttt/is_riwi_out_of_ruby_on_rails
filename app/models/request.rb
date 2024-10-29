class Request < ApplicationRecord
  validates :body, presence: true
  validates_with RequestModelBodyAttributeValidator
end
