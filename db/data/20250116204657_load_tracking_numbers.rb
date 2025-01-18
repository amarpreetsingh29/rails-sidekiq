# frozen_string_literal: true

class LoadTrackingNumbers < ActiveRecord::Migration[7.0]
  def up
    TrackingNumber.create!(
      carrier_id: 1,
      tag: "a123456789"
    )
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
