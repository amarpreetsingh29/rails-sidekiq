class TrackerSubscriptionSerializer < ActiveModel::Serializer
  attributes :tracking_number, :carrier, :subscription_url, :created_at

  def tracking_number
    object.tracking_number.tag
  end

  def carrier
    object.tracking_number.carrier.name
  end

  def subscription_url
    object.url
  end
end
