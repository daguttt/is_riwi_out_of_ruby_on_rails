class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
