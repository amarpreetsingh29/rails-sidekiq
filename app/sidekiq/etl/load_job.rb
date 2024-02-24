module Etl
  class LoadJob < BaseWorkerJob
    # loads tracking events into db
    def perform(args)
      args = args.with_indifferent_access
      TrackingEvent.create!(tracking_event_attrs(args))
    end

    private
    def tracking_event_attrs(args)
      {
        tracking_number: args[:tracking_number],
        carrier_id: args[:carrier_id],
        event: args[:event],
        happened_at: DateTime.parse(args[:happened_at])
      }
    end
  end
end
