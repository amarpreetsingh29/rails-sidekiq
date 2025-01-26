
class Api::TrackingEventsController < ApplicationController
  def generate_dummy
    Etl::ExtractJob.perform_async
    render plain: "OK"
  end

  def index
    tracking_number  = TrackingNumber.find_by(tag: params[:tracking_number])
    return render json: {error: "Tracking number not found"}, status: :not_found unless tracking_number.present?

    events = TrackingEvent.where(tracking_number: tracking_number)

    render json: tracking_number, status: 200, content_type: "application/json"
  end
end
