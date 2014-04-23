require_relative 'helper'
require_relative '../lib/zellers_year.rb'
require 'test/unit'

class TestYearsIntegration < Test::Unit::TestCase

  def test_year_1900_to_3000
    for i in 1800..3000
      output = `cal -h #{i}`
      assert_equal `./cal #{i}` , output
    end
  end
end
