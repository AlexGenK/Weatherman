class AddDescriptionToDimensions < ActiveRecord::Migration[7.0]
  def change
    add_column :dimensions, :description, :text
  end
end
