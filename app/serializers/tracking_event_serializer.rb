class TrackingEventSerializer < ActiveModel::Serializer
  attributes :event, :happened_at

  belongs_to :tracking_number
end
