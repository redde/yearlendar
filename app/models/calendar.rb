# Weekday:
#   %A - The full weekday name (``Sunday'')
#           %^A  uppercased (``SUNDAY'')
#   %a - The abbreviated name (``Sun'')
#           %^a  uppercased (``SUN'')
#   %u - Day of the week (Monday is 1, 1..7)
#   %w - Day of the week (Sunday is 0, 0..6)

require 'matrix'

class Calendar
  attr_accessor :year
  DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  RUDAYS = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье']
  HOLYDAYS = [RUDAYS.index('Суббота'), RUDAYS.index('Воскресенье')]
  MONTHS = [nil, 'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь']

  def initialize(year = nil)
    @year = (year || cal_year).to_i
  end

  def cal_year
    return Date.today.year + 1 if Date.today.month.to_i == 12
    Date.today.year
  end

  def result
    res = (1..12).map { |i| row_for_month(i) }
    end_index = res.sort { |i, j| j.size <=> i.size }.first.size
    res.map { |i| (end_index - i.size).times { i << nil }; i }
    matrix = Matrix[*res]
    matrix
  end

  def row_for_month(i)
    date = Date.new(year, i, 1)
    start_index = DAYS.index(date.strftime('%A'))
    res = []
    start_index.times { res << nil }
    (date..date.end_of_month).each do |day|
      res << day
    end
    res
  end

  def minimum_day
    (1..12).map do |i|
      Date.new(year, i, 1).strftime('%A')
    end.uniq.sort { |a, b| DAYS.index(a) <=> DAYS.index(b) }.first
  end

  def self.class_for_day(day)
    ["#{'red' if Calendar::HOLYDAYS.include?(day % 7)}", "#{'_holiday_top' if day % 7 == 5}", "#{'_holiday_bottom' if day % 7 == 6}"].select { |i| i.present? }.uniq
  end
end
