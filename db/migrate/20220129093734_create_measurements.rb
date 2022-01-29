class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.string :influx_id
      t.float :calibration
      t.float :coefficient
      t.integer :rank
      t.references :station, null: false, foreign_key: true
      t.references :dimension, null: false, foreign_key: true

      t.timestamps
    end
  end
end
