class Zellers_year
  attr_reader :year

  def initialize(year)
    @year = year.to_i
  end

  def print_year
    months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    for num in 1..12
      new_print(months[num - 1])
    end
  end

  def new_print(month)
    puts "#{month.to_s.capitalize} #{@year}".center(20)
    puts "Su Mo Tu We Th Fr Sa"
    format_month_body(month).each do |line|
      converted_line = line.map do |day|
        day.to_s.rjust(2)
      end
      puts converted_line.join(" ")
    end
    puts "\n"
  end


  def output
    "Result is #{year}!"
  end

  def what_year?
    @year
  end


  def print_month
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

  def get_number_of_month(m)
    (1..is_leap?[adjust_set_month(m)]).to_a
  end

  def format_month_body(m)
   d = ((first_day(m) + 5) % 7) + 1
    if d == 7
      d = 0
    end
    padding = Array.new(d, nil)
    (padding + get_number_of_month(m)).each_slice(7).to_a
  end

  def first_day(month)
   m = set_month(month)
   q = 1
   y = set_year(month)
   h = (q + (((m+1) * 26)/10) + y + (y/4) + (6 * (y/100)) + (y/400)) % 7
 end

 def refine_month(m)
   mon = check_num_str(m)
   adjust_month(mon)
 end

 def check_num_str(m)
   if m.to_i == 0
     m.to_s
   else
     m.to_i
   end
 end

 def adjust_month(m)
    months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
    if m.is_a? Integer
      months[m-1]
    else
      m
    end
  end

  def is_leap?
    if @year % 4 == 0 && @year % 100 == 0 && @year % 400 == 0
      [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    else
      [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end
  end

  def set_year(m)
    if set_month(m) > 2 and set_month(m) < 13
      @year.to_i
    else
      @year.to_i - 1
    end
  end

  def adjust_set_month(m)
    m_set = ["Unknown", "Unknown", "Unknown", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "january", "february"]
    index = m_set.index(m.to_s)
    if index < 13
      index - 1
    else
      index - 13
    end
  end

  def set_month(m)
    m_set = ["Unknown", "Unknown", "Unknown", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "january", "february"]
    m_set.index(m.to_s)
  end

  def return_day(num)
   days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wensday", "Thursday", "Friday"]
    days[num.to_i]
  end

end
