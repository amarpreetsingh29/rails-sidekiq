class TrackingNumberSerializer < ActiveModel::Serializer
  attributes :tag, :carrier, :tracking_events

  belongs_to :carrier
  has_many :tracking_events
end
