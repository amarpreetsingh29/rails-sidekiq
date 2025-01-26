class FindTracker
  def perform(options)
    TrackingNumber.find_by(tag: options[:tracking_number])
  end
end
