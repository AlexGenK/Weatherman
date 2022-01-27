class CreateDimensions < ActiveRecord::Migration[7.0]
  def change
    create_table :dimensions do |t|
      t.string :name
      t.string :unit
      t.string :category
      t.float :guideline

      t.timestamps
    end
  end
end
