class TestObject
  def self.derived_classes
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def expect_same(assertion, actual, message = nil)
    if assertion == actual
      puts "    PASSED! :D\n\n"
      true
    else
      puts "    FAILURE - #{message}\n    ASSERTION: #{assertion}\n    Actual: #{actual}\n\n"
      false
    end
  end

  def run_tests
    tests = 0
    failures = 0
    puts "RUNNING TESTS FOR #{self.class.name}\n\n"
    test_methods = self.class.instance_methods(false).select { |method| method.start_with?("test_") }
    test_methods.each do |method| 
      (puts method.to_s)
      success = self.send(method.to_s)
      tests += 1
      failures += 1 unless success
    end
    puts "RESULTS:"
    puts "    #{failures.to_s} tests failed out of #{tests}\n\n"
  end
end