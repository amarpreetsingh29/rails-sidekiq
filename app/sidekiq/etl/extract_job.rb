module Etl
  class ExtractJob < BaseWorkerJob
    def perform
      file_path = 'app/assets/csv/carrier_tracking_data.csv'
      options = {
        headers: true
      }
      carrier = Carrier.find_by(name: 'USPS')
      CsvParserHelper.parse_line_by_line(path: file_path, options: options) do |csv_row|
        Etl::TransformJob.perform_async(csv_row.to_h.merge("carrier_id" => carrier.id))
      end
    end
  end
end
