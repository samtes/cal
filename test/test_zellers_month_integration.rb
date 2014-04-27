require_relative 'helper'
require_relative '../lib/zellers_month.rb'
require 'test/unit'

class TestMonthsIntegration < Test::Unit::TestCase

  def test_02_1900_first_line
    output = `ruby cal 02 1900`
    assert_equal `cal 02 1900`.split("\n")[0], output.split("\n")[0]
  end

  def test_02_2012_last_line
    output = `ruby cal 02 2012`
    assert_equal `cal 02 2012`.split("\n")[5], output.split("\n")[5]
  end

  def test_12_1799
    output = `ruby cal 12 1799`
    assert_equal "Argument must be for a date between the years 1800 and 3000\n", output
  end

  def test_01_3001
    output = `ruby cal 01 3001`
    assert_equal "Argument must be for a date between the years 1800 and 3000\n", output
  end

  def test_no_arguments
    output = `ruby cal`
    assert_equal "You must provide a month or a year\n", output
  end

  def test_02_2012
    output = `ruby cal 02 2012`
    assert_equal `cal 02 2012`, output
  end

  def test_01_2012
    output = `ruby cal 01 2012`
    assert_equal `cal 01 2012`, output
  end

  def test_09_2012
    output = `ruby cal 09 2012`
    assert_equal `cal 09 2012`, output
  end

  def test_02_2015
    output = `ruby cal 01 2015`
    assert_equal `cal 01 2015`, output
  end

  def test_02_1900
    output = `ruby cal 02 1900`
    assert_equal `cal 02 1900`, output
  end

  def test_crazy_test_1800_to_3000
    skip
    for i in 1800..3000
      for j in 1..12
        expected = `cal -h #{j} #{i}`
        actual = `./cal #{j} #{i}`
        assert_equal expected, actual
      end
    end
  end
end
