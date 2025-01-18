

class TrackingController < ApplicationController
  def generate
    Etl::ExtractJob.perform_async
    render plain: "OK"
  end

  def carriers
    carriers = Carrier.all
    render json: carriers, status: 200, content_type: "application/json"
  end

  def events
    tracking_number  = TrackingNumber.find_by(tag: params[:id])
    return render json: {error: "Not Found"}, status: :not_found unless tracking_number.present?

    events = TrackingEvent.includes(:carrier).where(tracking_number: tracking_number)
    render json: events, status: 200, content_type: "application/json"
  end
end
