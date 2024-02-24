module Etl
  class TransformJob < BaseWorkerJob
    path = File.join(Rails.root, "db", "yaml" ,"carrier_tracking_codes.yml")
    TRACKING_CODES = YAML.load_file(File.open(path))

    def perform(args)
      args = args.with_indifferent_access
      Etl::LoadJob.perform_async(transform_args(args))
    end

    def transform_args(args)
      {
        'tracking_number' => args[:tracking_num],
        'carrier_id'=> args[:carrier_id],
        'happened_at'=> args[:happened_at],
        'event'=> TRACKING_CODES[args[:tracking_code]] || TRACKING_CODES['UN']
      }
    end
  end
end
