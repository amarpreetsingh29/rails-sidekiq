module Etl
  class LoadJob < BaseWorkerJob
    # loads tracking events into db
    def perform(args)
      args = args.with_indifferent_access
      tracking_number = TrackingNumber.find_or_create_by!(
        tag: args[:tracking_number],
        carrier_id: args[:carrier_id],
      )
      TrackingEvent.create!(tracking_event_attrs(args).merge({tracking_number: tracking_number}))
    end

    private

    def tracking_event_attrs(args)
      {
        event: args[:event],
        happened_at: DateTime.parse(args[:happened_at])
      }
    end
  end
end
