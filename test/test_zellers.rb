require_relative 'helper'
require_relative '../lib/zellers_month.rb'

class TestZellers_configuration < MiniTest::Unit::TestCase
  def test_if_rake_runs
    assert_equal true, true
  end

  def test_output_for_month_and_date
    june_2000 = Zellers_month.new("june", 2000)
    assert_equal("Result is June, 2000!", june_2000.output)
  end

  def test_output_without_month
    june_2000 = Zellers_month.new("", 2000)
    assert_equal("Result is 2000!", june_2000.output)
  end

  def test_output_without_input
    june_2000 = Zellers_month.new("", "")
    assert_raises ArgumentError do
      june_2000.output("There is no argument passed")
    end
  end

  def test_month_name_january_a
    january_2000 = Zellers_month.new("january", 2000)
    assert_equal("January", january_2000.name)
  end

  def test_month_name_january_b
    january_2000 = Zellers_month.new(1, 2000)
    assert_equal("January", january_2000.name)
  end

  def test_month_name_february_a
    february_2000 = Zellers_month.new("february", 2000)
    assert_equal("February", february_2000.name)
  end

  def test_month_name_february_b
    february_2000 = Zellers_month.new(2, 2000)
    assert_equal("February", february_2000.name)
  end

  def test_month_name_march_a
    march_2000 = Zellers_month.new("march", 2000)
    assert_equal("March", march_2000.name)
  end

  def test_month_name_march_b
    march_2000 = Zellers_month.new(3, 2000)
    assert_equal("March", march_2000.name)
  end

  def test_month_name_april_a
    april_2000 = Zellers_month.new("april", 2000)
    assert_equal("April", april_2000.name)
  end

  def test_month_name_april_b
    april_2000 = Zellers_month.new(4, 2000)
    assert_equal("April", april_2000.name)
  end

  def test_month_name_may_a
    may_2000 = Zellers_month.new("may", 2000)
    assert_equal("May", may_2000.name)
  end

  def test_month_name_may_b
    may_2000 = Zellers_month.new(5, 2000)
    assert_equal("May", may_2000.name)
  end

  def test_month_name_june_a
    june_2000 = Zellers_month.new("june", 2000)
    assert_equal("June", june_2000.name)
  end

  def test_month_name_june_b
    june_2000 = Zellers_month.new(6, 2000)
    assert_equal("June", june_2000.name)
  end

  def test_month_name_july_a
    july_2000 = Zellers_month.new("july", 2000)
    assert_equal("July", july_2000.name)
  end

  def test_month_name_july_b
    july_2000 = Zellers_month.new(7, 2000)
    assert_equal("July", july_2000.name)
  end

  def test_month_name_august_a
    august_2000 = Zellers_month.new("august", 2000)
    assert_equal("August", august_2000.name)
  end

  def test_month_name_august_b
    august_2000 = Zellers_month.new(8, 2000)
    assert_equal("August", august_2000.name)
  end

  def test_month_name_september_a
    september_2000 = Zellers_month.new("september", 2000)
    assert_equal("September", september_2000.name)
  end

  def test_month_name_september_b
    september_2000 = Zellers_month.new(9, 2000)
    assert_equal("September", september_2000.name)
  end

  def test_month_name_october_a
    october_2000 = Zellers_month.new("october", 2000)
    assert_equal("October", october_2000.name)
  end

  def test_month_name_october_b
    october_2000 = Zellers_month.new(10, 2000)
    assert_equal("October", october_2000.name)
  end

  def test_month_name_november_a
    november_2000 = Zellers_month.new("november", 2000)
    assert_equal("November", november_2000.name)
  end

  def test_month_name_novemver_b
    november_2000 = Zellers_month.new(11, 2000)
    assert_equal("November", november_2000.name)
  end

  def test_month_name_december_a
    december_2000 = Zellers_month.new("december", 2000)
    assert_equal("December", december_2000.name)
  end

  def test_month_name_december_b
    december_2000 = Zellers_month.new(12, 2000)
    assert_equal("December", december_2000.name)
  end

  def test_month_length_jan
    jan_2000 = Zellers_month.new(1, 2000)
    assert_equal(31, jan_2000.length)
  end

  def test_month_length_feb_2000
    feb_2000 = Zellers_month.new(2, 2000)
    assert_equal(29, feb_2000.length)
  end

  def test_month_length_feb_2010
    feb_2010 = Zellers_month.new(2, 2010)
    assert_equal(28, feb_2010.length)
  end

  def test_month_length_mar_2000
    mar_2000 = Zellers_month.new(3, 2010)
    assert_equal(31, mar_2000.length)
  end

  def test_month_length_apr_2010
    apr_2010 = Zellers_month.new(4, 2010)
    assert_equal(30, apr_2010.length)
  end

  def test_month_length_may_2010
    may_2010 = Zellers_month.new(5, 2010)
    assert_equal(31, may_2010.length)
  end

  def test_month_length_jun_2010
    jun_2010 = Zellers_month.new(6, 2010)
    assert_equal(30, jun_2010.length)
  end

  def test_month_length_jul_2010
    jul_2010 = Zellers_month.new(7, 2010)
    assert_equal(31, jul_2010.length)
  end

  def test_month_length_aug_2010
    aug_2010 = Zellers_month.new(8, 2010)
    assert_equal(31, aug_2010.length)
  end

  def test_month_length_sep_2010
    sep_2010 = Zellers_month.new(9, 2010)
    assert_equal(30, sep_2010.length)
  end

  def test_month_length_oct_2010
    oct_2010 = Zellers_month.new(10, 2010)
    assert_equal(31, oct_2010.length)
  end

  def test_month_length_nov_2010
    nov_2010 = Zellers_month.new(11, 2010)
    assert_equal(30, nov_2010.length)
  end

  def test_month_length_dec_2010
    dec_2010 = Zellers_month.new(12, 2010)
    assert_equal(31, dec_2010.length)
  end

  def test_first_day_of_month_with_num_output
    june_2000 = Zellers_month.new(6, 2000)
    assert_equal("Result is June, 2000!", june_2000.output)
  end

  def test_to_see_methos_responds
    june_2000 = Zellers_month.new("june", 2000)
    assert june_2000.respond_to? :output
  end
end
