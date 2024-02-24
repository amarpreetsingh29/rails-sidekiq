module CsvParserHelper
  def self.parse_line_by_line(path:, options:, &block)
    CSV.foreach(path, **options) do |row|
      if block_given?
        yield row
      else
        raise "block required"
      end
    end
  end

  def all(path_to_csv, options, &block)
    rows = CSV.read(path_to_csv, **options)
    yield rows if block_given?
  end

  def iterate_in_batch(path_to_csv, options, batch_size, &block)

  end
end
