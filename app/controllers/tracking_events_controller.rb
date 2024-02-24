

class TrackingEventsController < ApplicationController
  def schedule
    Etl::ExtractJob.perform_async
  end
end
