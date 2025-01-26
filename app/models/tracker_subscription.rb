class TrackerSubscription < ApplicationRecord
  belongs_to :tracking_number

  validates :tracking_number, presence: true
  validates :url, presence: true
end
