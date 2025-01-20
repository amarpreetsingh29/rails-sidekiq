

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
