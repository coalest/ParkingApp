class CreateParkingSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_spots do |t|
      t.string :label

      t.timestamps
    end
  end
end
