

class TrackingEventsController < ApplicationController
  def schedule
    Etl::ExtractJob.perform_async
    render plain: "OK"
  end

  def carriers
    carriers = Carrier.all
    render json: carriers, status: 200, content_type: "application/json"
  end

  def list
    events = TrackingEvent.includes(:carrier).all
    render json: events, status: 200, content_type: "application/json"
  end
end
