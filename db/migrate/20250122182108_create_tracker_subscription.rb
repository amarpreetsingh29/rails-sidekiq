class CreateTrackerSubscription < ActiveRecord::Migration[7.0]
  def change
    create_table :tracker_subscriptions do |t|
      t.integer :tracking_number_id
      t.string :url

      t.timestamps
    end
  end
end
