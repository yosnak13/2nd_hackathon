class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :station_name
      t.string :station_number
      t.string :line

      t.timestamps
    end
  end
end
