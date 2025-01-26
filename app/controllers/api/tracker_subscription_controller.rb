class Api::TrackerSubscriptionController < ApplicationController
  def create
    tracking_number = TrackingNumber.find_by(tag: params[:tracking_number])
    return render json: {error: "Tracking Number not found"} unless tracking_number.present?

    subscription = TrackerSubscription.create!(
      url: params[:url],
      tracking_number: tracking_number
    )
    render json: subscription, status: :created, content_type: "application/json"
  end

  def show
    tracking_number = TrackingNumber.find_by(tag: params[:tracking_number])
    return render json: {error: "Tracking Number not found"} unless tracking_number.present?

    subscriptions = TrackerSubscription.includes(tracking_number: :carrier).where(tracking_number: tracking_number)

    return render json: show_response(tracking_number, subscriptions), status: :ok, content_type: "application/json"
  end

  private

  def show_response(tracking_number, subscriptions)
    {
      tracking_number: tracking_number.tag,
      carrier: tracking_number.carrier.name,
      subscriptions: subscriptions.map do |subscription|
        TrackerSubscriptionSerializer.new(subscription).as_json.except(:tracking_number, :carrier)
      end
    }
  end
end
