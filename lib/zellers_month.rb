class Zellers_month
  attr_reader :month, :year

  def initialize(month, year)
    @month = refine_month(month)
    @year = year.to_i
  end


  def new_print
    puts "#{@month.capitalize} #{@year}".center(20)
    puts "Su Mo Tu We Th Fr Sa"
    format_month_body.each do |line|
      converted_line = line.map do |day|
        day.to_s.rjust(2)
      end
      puts converted_line.join(" ")
    end
    puts "\n"
  end


  def output
    if month.to_s.length < 1 && year.to_s.length < 1
      raise ArgumentError, 'There is no arrgument passed'
    elsif month.length > 0
      "Result is #{@month.capitalize}, #{year}!"
    else
      "Result is #{year}!"
    end
  end

  def name
    @month.capitalize
  end

  def length
    is_leap?[adjust_set_month]
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

  def get_number_of_month
    (1..is_leap?[adjust_set_month]).to_a
  end

  def format_month_body
   d = ((first_day + 5) % 7) + 1
    if d == 7
      d = 0
    end
    padding = Array.new(d, nil)
    (padding + get_number_of_month).each_slice(7).to_a
  end

  def first_day
   m = set_month
   q = 1
   y = set_year
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

  def set_year
    if set_month > 2 and set_month < 13
      @year.to_i
    else
      @year.to_i - 1
    end
  end

  def adjust_set_month
    m_set = ["Unknown", "Unknown", "Unknown", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "january", "february"]
    index = m_set.index(@month.to_s)
    if index < 13
      index - 1
    else
      index - 13
    end
  end

  def set_month
    m_set = ["Unknown", "Unknown", "Unknown", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "january", "february"]
    m_set.index(@month.to_s)
  end

  def return_day(num)
   days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wensday", "Thursday", "Friday"]
    days[num.to_i]
  end

end
