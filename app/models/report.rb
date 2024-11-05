class Report < ApplicationRecord
  self.inheritance_column = :ReportType
end
