class Zellers_month
  attr_reader :month, :year
  @@m_set = ["Unknown", "Unknown", "Unknown", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "january", "february"]

  def initialize(month, year)
    @month = refine_month(month)
    @year = year.to_i
  end

  #prints the month requested by user
  def print_month
    print "#{@month.capitalize} #{@year}".center(20) + "  "
    puts "\n"
    print "Su Mo Tu We Th Fr Sa"  + "  "
    puts "\n"
    format_month_body.each do |line|
      converted_line = line.map do |day|
        day.to_s.rjust(2)
      end
      puts converted_line.join(" ") + "  "
    end
  end

  def name
    @month.capitalize
  end

  #prints the number of days in the month requested
  def length
    is_leap?[adjust_set_month]
  end

  #prints the month requested by user in a different way
  def print_month_old
    day = 1
    days = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    start_index = [18, 0, 3, 6, 9, 12, 15]
    start_day = first_day
    start = start_index[start_day]
    puts "#{@month.capitalize} #{@year}".center(20)
    puts "Su Mo Tu We Th Fr Sa" + "\n"

    start_index.each do |num|
      if start == num
        num.times {print "\s"}
        if day.to_s.length == 1
          print " " + day.to_s + "\s"
        else
          print day.to_s + "\s"
        end
      end
    end
    print_and_break(start + 3, 2)
    puts "\n"
    puts "\n"
  end

 private

 #prints each weeks of the month
  def print_and_break(start, day)
    set_day = day
    num_of_month = is_leap?[adjust_set_month]
    print_time = (((18 - start)/3)+1)


    if set_day <= num_of_month - 7
      print_time.times do
        if set_day.to_s.length == 1
          print "\s" + set_day.to_s + "\s"
          set_day += 1
        else
          print set_day.to_s + "\s"
          set_day += 1
        end
      end
      print "\n"
      print_and_break(0, set_day)
    else
      for i in set_day..num_of_month
        print i.to_s + "\s"
      end
    end
  end

  #returns the number of the month
  def get_number_of_month
    (1..is_leap?[adjust_set_month]).to_a
  end

  #format the month in a multidimentional array of arrays
  def format_month_body
   d = ((first_day + 5) % 7) + 1
    if d == 7
      d = 0
    end
    padding = Array.new(d, nil)
    updated_list = (padding + get_number_of_month).each_slice(7).to_a
    updated_list.each do |a|
      if a.length < 7
        (7 - a.length).times {a << nil}
      end
    end
    (6 - updated_list.length).times {updated_list << Array.new(7, nil)}
    updated_list
  end

  #returns the first day of the month
  def first_day
   m = set_month
   q = 1
   y = set_year
   h = (q + (((m+1) * 26)/10) + y + (y/4) + (6 * (y/100)) + (y/400)) % 7
 end

 #makes sure that the month is converted in to a string
 def refine_month(m)
   mon = check_num_str(m)
   adjust_month(mon)
 end

 #checks if the month passed is a word or a number
 def check_num_str(m)
   if m.to_i == 0
     m.to_s
   else
     m.to_i
   end
 end

 #returns the month the user has passed
 def adjust_month(m)
    months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    if m.is_a? Integer
      months[m-1]
    else
      m
    end
  end

  def is_leap?
    if @year % 4 == 0 && @year % 100 != 0 || @year % 400 == 0
      [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    else
      [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
  end

  #coverts the year into the zellers year
  def set_year
    if set_month > 2 and set_month < 13
      @year.to_i
    else
      @year.to_i - 1
    end
  end

  #converts the month into zellers month
  def adjust_set_month
    index = @@m_set.index(@month.to_s)
    if index < 13
      index - 1
    else
      index - 13
    end
  end

  def set_month
    @@m_set.index(@month.to_s)
  end

  def return_day(num)
   days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wensday", "Thursday", "Friday"]
    days[num.to_i]
  end

end
