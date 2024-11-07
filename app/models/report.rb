class Report < ApplicationRecord
  self.inheritance_column = "report_type"
  enum :type, [ :coffee, :water, :toilet_paper, :soap ]
end
