class TrackingEvent < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :tracking_number

  validates :tracking_number, presence: true
  validates :event, presence: true
  validates :happened_at, presence: true

  scope :usps, -> { where(carrier: 'usps') }
end
