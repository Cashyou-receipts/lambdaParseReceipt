load_paths = Dir["./vendor/bundle/ruby/3.2.0/gems/**/lib"]
$LOAD_PATH.unshift(*load_paths)
$VERBOSE = nil
require_relative 'direct_reporter'

def lambda_handler(event:, context:)
  reporter = DirectReporter.new
  reporter.text_balance_to_person!(event[:phone_number], event[:object_key])
end