class RemoveColumnCarrierId < ActiveRecord::Migration[7.0]
  def change
    remove_column(:tracking_events, :carrier_id)
  end
end
