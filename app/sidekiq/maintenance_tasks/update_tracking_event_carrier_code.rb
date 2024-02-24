module MaintenanceTasks
  class UpdateTrackingEventCarrierCode < ApplicationJob
    include JobIteration::Iteration

    def build_enumerator(cursor:)
      enumerator_builder.active_record_on_records(
        TrackingEvent.all,
        cursor: cursor,
      )
    end

    def each_iteration(tracking_event)
      tracking_event.update!(carrier_id: Carrier.find_by(name: 'USPS')&.id)
    end
  end
end
