# config/initializers/opentelemetry.rb
require 'opentelemetry/sdk'
require 'opentelemetry/instrumentation/all'
require 'opentelemetry-exporter-otlp'

OpenTelemetry.logger.level = Logger::DEBUG

OpenTelemetry::SDK.configure do |c|
  c.service_name = ENV['SERVICE_NAME']
  c.use_all() # enables all instrumentation!
end
