class ChangeTypeToIntegerInReports < ActiveRecord::Migration[7.2]
  def up
    # Add the new `type` column as integer
    add_column :reports, :new_type, :integer

    # Populate `new_type` based on current string `type`
    Report.reset_column_information # Reset caching
    Report.find_each do |report|
      case report.type
      when "COFFEE"
        report.update_column(:new_type, 0)
      when "WATER"
        report.update_column(:new_type, 1)
      when "TOILET_PAPER"
        report.update_column(:new_type, 2)
      when "SOAP"
        report.update_column(:new_type, 3)
      end
    end

    # Remove the old string column and rename the new integer column
    remove_column :reports, :type
    rename_column :reports, :new_type, :type
  end
  def down
    add_column :reports, :old_type, :string

    Report.reset_column_information
    Report.find_each do |report|
      case report.type
      when 0
        report.update_column(:old_type, "COFFEE")
      when 1
        report.update_column(:old_type, "WATER")
      when 2
        report.update_column(:old_type, "TOILET_PAPER")
      when 3
        report.update_column(:old_type, "SOAP")
      end
    end
  end
end
