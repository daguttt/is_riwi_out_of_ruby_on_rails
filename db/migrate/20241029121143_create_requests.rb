class CreateRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :requests do |t|
      t.string :type

      t.timestamps
    end
  end
end
