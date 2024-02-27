

class TrackingEventsController < ApplicationController
  def schedule
    Etl::ExtractJob.perform_async
    render plain: "OK"
  end
end
