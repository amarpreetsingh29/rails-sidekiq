class CreateTrackingEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :tracking_events do |t|
      t.string :tracking_number
      t.integer :carrier_id
      t.text :event
      t.datetime :happened_at

      t.timestamps
    end
  end
end
