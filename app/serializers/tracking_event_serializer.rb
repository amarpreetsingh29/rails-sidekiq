class TrackingEventSerializer < ActiveModel::Serializer
  attributes :id, :tracking_number, :carrier, :event, :happened_at

  belongs_to :carrier
  belongs_to :tracking_number
end
