class TrackingNumberSerializer < ActiveModel::Serializer
  attributes :tracking_number, :last_event_message, :last_event_happened_at, :created_at

  belongs_to :carrier
  has_many :tracking_events

  def tracking_number
    object.tag
  end

  def carrier
    object.carrier.name
  end

  def last_event_message
    object.tracking_events.last&.event
  end

  def last_event_happened_at
    object.tracking_events.last&.happened_at
  end

  def created_at
    object.created_at
  end
end
