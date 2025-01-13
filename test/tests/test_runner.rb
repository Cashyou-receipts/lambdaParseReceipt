require_relative './test_object'
require_relative './test_tester'

class TestRunner
  def self.test(test_klass = nil, test_name = nil)
    if test_klass
      if Object.const_defined?(test_klass)
        tester = Object.const_get(test_klass).new
        puts "RUNNING TEST #{test_name}"
        if test_name
          tester.respond_to?(test_name) ? tester.send(test_name) : (puts "No such test")
        else
          begin
            tester.new.run_tests
          rescue => exception
            puts "run_tests method not defined or something else went wrong"
          end
        end
      else
        puts "Class not defined"
      end
    else
      TestObject.derived_classes.each { |klass| klass.new.run_tests }
    end
    return "Finished"
  end
end

# paste the following lines into an irb session:
# require './test/tests/test_runner'
# TestRunner.test(*args)