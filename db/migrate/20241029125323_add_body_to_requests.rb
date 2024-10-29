class AddBodyToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :body, :string
  end
end
