Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.custom_options = ->(event) {
    current_span = OpenTelemetry::Trace.current_span
    {
      trace_id: current_span.context.trace_id.unpack1('H*'),
      span_id: current_span.context.span_id.unpack1('H*'),
    }
  }
end
