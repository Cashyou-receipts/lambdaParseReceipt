require 'json'
require 'pry'
require File.join(Dir.pwd, "test_environment.rb")
Dir.glob(File.join(Dir.pwd, "/src/*.rb")).each do |file|
  require file
end
Dir.glob(File.join(__dir__, "/*.rb")).each do |file|
  require_relative file unless file.include?('test_object.rb')
end

# TestRunner.test "ReceiptDissectorItemsTest"