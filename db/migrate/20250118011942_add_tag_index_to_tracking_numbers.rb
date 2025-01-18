class AddTagIndexToTrackingNumbers < ActiveRecord::Migration[7.0]
  def change
    add_index(:tracking_numbers, :tag)
  end
end
