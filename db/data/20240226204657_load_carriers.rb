# frozen_string_literal: true

class LoadCarriers < ActiveRecord::Migration[7.0]
  def up
    Carrier.create!(
      name: "USPS"
    )
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
