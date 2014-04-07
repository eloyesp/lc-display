class LcDisplay

  attr_reader :size, :digits

  ROWS = [ :h1, :v1, :h2,
           :v2, :h3, :blank ]

  DIGIT_DATA = [
    { h1: '-', v1: ['|', '|'], h2: ' ', v2: ['|', '|'], h3: '-'},
    { h1: ' ', v1: [' ', '|'], h2: ' ', v2: [' ', '|'], h3: ' '},
    { h1: '-', v1: [' ', '|'], h2: '-', v2: ['|', ' '], h3: '-'},
    { h1: '-', v1: [' ', '|'], h2: '-', v2: [' ', '|'], h3: '-'},
    { h1: ' ', v1: ['|', '|'], h2: '-', v2: [' ', '|'], h3: ' '},
    { h1: '-', v1: ['|', ' '], h2: '-', v2: [' ', '|'], h3: '-'},
    { h1: '-', v1: ['|', ' '], h2: '-', v2: ['|', '|'], h3: '-'},
    { h1: '-', v1: [' ', '|'], h2: ' ', v2: [' ', '|'], h3: ' '},
    { h1: '-', v1: ['|', '|'], h2: '-', v2: ['|', '|'], h3: '-'},
    { h1: '-', v1: ['|', '|'], h2: '-', v2: [' ', '|'], h3: '-'},
  ]

  def initialize size
    @size = size.to_i
  end

  def render number
    @digits = convert_to_digits number
    ROWS.map do |row|
      render_row row
    end
  end

  def self.process input
    input.each_line.map do |line|
      size, number = line.split ' '
      unless size == '0' && number == '0'
        display = new size
        display.render number
      end
    end.join
  end

  private

  def convert_to_digits number
    number.to_s.chars.map(&:to_i)
  end

  def render_row row
    case row
    when /h\d/
      digits.map do |digit|
        " #{ dash?(digit, row) * size }  "
      end << "\n"
    when /v\d/
      size.times.map do
        digits.map do |digit|
          v1, v2 = dash? digit, row
          "#{ v1 }#{ ' ' * size }#{ v2 } "
        end << "\n"
      end
    when :blank
      "\n"
    end
  end

  def dash? digit, row
    DIGIT_DATA[digit][row] or raise "missing data digit: #{ digit}, row: #{ row }"
  end

end
