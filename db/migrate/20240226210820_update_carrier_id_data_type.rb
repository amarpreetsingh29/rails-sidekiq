class UpdateCarrierIdDataType < ActiveRecord::Migration[7.0]
  def change
    change_column(:tracking_events, :carrier_id, :int)
  end
end
