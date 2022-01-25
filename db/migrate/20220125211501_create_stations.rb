class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.text :address
      t.string :influx_id

      t.timestamps
    end
  end
end
