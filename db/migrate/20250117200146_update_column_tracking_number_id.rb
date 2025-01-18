class UpdateColumnTrackingNumberId < ActiveRecord::Migration[7.0]
  def change
    rename_column(:tracking_events, :tracking_number, :tracking_number_id)
  end
end
