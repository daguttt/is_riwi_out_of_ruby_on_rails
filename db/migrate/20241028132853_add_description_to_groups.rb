class AddDescriptionToGroups < ActiveRecord::Migration[7.2]
  def change
    add_column :groups, :description, :string
  end
end
