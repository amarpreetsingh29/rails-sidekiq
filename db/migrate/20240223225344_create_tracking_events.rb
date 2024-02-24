class CreateTrackingEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :tracking_events do |t|
      t.string :tracking_number
      t.string :carrier
      t.text :event
      t.datetime :happened_at

      t.timestamps
    end
  end
end
