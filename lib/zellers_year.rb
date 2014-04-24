class Zellers_year
  attr_reader :year
  @@m_set = ["Unknown", "Unknown", "Unknown", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "january", "february"]
  @@months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

  def initialize(year, row=3)
    @year = year.to_i
    @row = row.to_i
  end

  def row?
    @row
  end

  #prints the year in 3 rows (default) or in rows passed.
  def print_year
    print_top_year
    print_body_rows
  end

  def output
    "Result is #{@year}!"
  end

  #checkes if the year is a lea year or not
  def is_leap_year?
    if @year % 4 == 0 && @year % 100 != 0 || @year % 400 == 0
      "Yes, it is!"
    else
      "No, it's not!"
    end
  end

 private

  #prints the top year centered to the number of rows
  def print_top_year
    length_of_row = @row * 10 + 2
    puts "#{@year}".rjust(length_of_row)
  end

  #prints the months based on the number of months in a row
  def print_body_rows
    i = 0
    columns = 12/@row
    columns.times do
      print_year_header(i)
      puts "\n"
      iterate(i)
      i += @row
    end
  end

  #prints the month and week headers based on the number of rows
  def print_year_header(mon)
    index = mon
    @row.times do
      print "#{@@months[index].to_s.capitalize.center(20)}  "
      index += 1
    end
    puts "\n"
    @row.times do
      print "#{"Su Mo Tu We Th Fr Sa".center(20)}  "
    end
  end

  #prints the actual days of the months in the row
  def iterate(m)
    i = 0
    6.times do
      print_year_body(m, i)
      i += 1
    end
  end

  #prints each weeks of the months in the row
  def print_year_body(mon, itr)
    index = mon
    @row.times do
      converted_line = format_month_body(@@months[index])[itr].map do |day|
        day.to_s.rjust(2)
      end
      index += 1
      print converted_line.join(" ") + "  "
    end
    puts  "\n"
  end

  #returns the number of months in the requested month
  def get_number_of_month(m)
    (1..is_leap?[adjust_set_month(m)]).to_a
  end

  #arranges the days of the month in a multi multidimensional array of 6 arrays
  def format_month_body(m)
   d = ((first_day(m) + 5) % 7) + 1
    if d == 7
      d = 0
    end
    padding = Array.new(d, nil)
    updated_list = (padding + get_number_of_month(m)).each_slice(7).to_a
    updated_list.each do |a|
      if a.length < 7
        (7 - a.length).times do
          a << nil
        end
      end
    end
    (6 - updated_list.length).times do
          updated_list << Array.new(7, nil)
    end
    updated_list
  end

  #returns the day where the month starts
  def first_day(month)
   m = set_month(month)
   q = 1
   y = set_year(month)
   h = (q + (((m+1) * 26)/10) + y + (y/4) + (6 * (y/100)) + (y/400)) % 7
 end

  def is_leap?
    if @year % 4 == 0 && @year % 100 != 0 || @year % 400 == 0
      [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    else
      [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
  end

  #arranges the year into zellers year
  def set_year(m)
    if set_month(m) > 2 and set_month(m) < 13
      @year.to_i
    else
      @year.to_i - 1
    end
  end

  #arranges the month into zellers month
  def adjust_set_month(m)
    index = @@m_set.index(m.to_s)
    if index < 13
      index - 1
    else
      index - 13
    end
  end

  #returns the index of the month passed
  def set_month(m)
    @@m_set.index(m.to_s)
  end

end
