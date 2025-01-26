class TrackingNumber < ApplicationRecord
  belongs_to :carrier
  has_many :tracking_events
  has_many :tracker_subscriptions

  validates :carrier_id, presence: true
  validates :tag, presence: true, uniqueness: true
end
