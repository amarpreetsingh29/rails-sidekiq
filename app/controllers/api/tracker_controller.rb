

class Api::TrackerController < ApplicationController
  def index
    trackers = TrackingNumber.includes(:tracking_events, :carrier).all
    render json: trackers, status: 200, content_type: "application/json"
  end

  def show
    render json: TrackingNumber.find_by(tag: params[:tracking_number]), status: 200, content_type: "application/json"
  end

  def create
    if params[:carrier].blank? || params[:tracking_number].blank?
      return render json: {error: "Carrier and tracking number are required"}, status: :unprocessable_entity
    end

    carrier = Carrier.find_by(name: params[:carrier].upcase)
    return render json: {error: "Not Found"}, status: :not_found unless carrier.present?

    tracking_number = TrackingNumber.create!(
      tag: params[:tracking_number],
      carrier: carrier
    )

    render json: tracking_number, status: 201, content_type: "application/json"
  end
end
