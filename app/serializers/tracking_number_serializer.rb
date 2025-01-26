class TrackingNumberSerializer < ActiveModel::Serializer
  attributes :tracking_number, :carrier, :tracking_events

  belongs_to :carrier
  has_many :tracking_events

  def tracking_number
    object.tag
  end

  def carrier
    object.carrier.name
  end
end
