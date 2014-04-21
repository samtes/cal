class Cal
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def output
    puts "Result is #{month}, #{year}!"
  end
end

