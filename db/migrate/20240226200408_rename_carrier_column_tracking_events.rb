class RenameCarrierColumnTrackingEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :tracking_events, :carrier, :carrier_id
  end
end
