require_relative 'helper'
require_relative '../lib/zellers_year.rb'


class TestZellers_configuration < MiniTest::Unit::TestCase
  def test_if_rake_runs
    assert_equal true, true
  end

  def test_output_for_month_and_date
    t2000 = Zellers_year.new(2000)
    assert_equal("Result is 2000!", t2000.output)
  end

  def test_year_1900
    t1900 = Zellers_year.new(1900)
    assert_equal("No, it's not!", t1900.is_leap_year?)
  end

  def test_year_2000
    t2000 = Zellers_year.new(2000)
    assert_equal("Yes, it is!", t2000.is_leap_year?)
  end

  def test_year_2001
    t2001 = Zellers_year.new(2001)
    assert_equal("No, it's not!", t2001.is_leap_year?)
  end
end
