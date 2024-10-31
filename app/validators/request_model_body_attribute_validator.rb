class RequestModelBodyAttributeValidator < ActiveModel::Validator
  ALLOWED_VALUES = [ "WATER", "COFFEE", "TOILET_PAPER", "SOAP" ]

  def validate(record)
    unless ALLOWED_VALUES.include?(record.body)
      record.errors.add(:body, "Must be one of: #{ALLOWED_VALUES.join(', ')}")
    end
  end
end
