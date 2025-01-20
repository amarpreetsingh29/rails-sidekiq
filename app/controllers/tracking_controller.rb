

class TrackingController < ApplicationController
  def carriers
    carriers = Carrier.all
    render json: {carriers: ActiveModelSerializers::SerializableResource.new(carriers) }, status: 200, content_type: "application/json"
  end

  def generate_dummy_events
    Etl::ExtractJob.perform_async
    render plain: "OK"
  end

  def events
    tracking_number  = TrackingNumber.find_by(tag: params[:id])
    return render json: {error: "Not Found"}, status: :not_found unless tracking_number.present?

    events = TrackingEvent.where(tracking_number: tracking_number)

    render json: tracking_number, status: 200, content_type: "application/json"
  end
end
