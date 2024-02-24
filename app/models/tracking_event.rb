class TrackingEvent < ApplicationRecord
  belongs_to :carrier

  validates :tracking_number,on: :create, presence: true
  validates :carrier, on: :create, presence: true
  validates :event, on: :create, presence: true
  validates :happened_at, presence: true

  scope :usps, -> { where(carrier: 'usps') }
end
