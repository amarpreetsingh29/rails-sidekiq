class CreateTrackingNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :tracking_numbers do |t|
      t.string :tag
      t.integer :carrier_id

      t.timestamps
    end
  end
end
