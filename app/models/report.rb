class Report < ApplicationRecord
  self.inheritance_column = "report_type"
end
