class Integer
  VERSION = 1

  def to_roman
    RomanNumerals::Converter.new(self).convert
  end
end

module RomanNumerals
  class Converter
    attr_reader :number
    
    def initialize(number)
      @number = number
    end

    def convert
      number_ary = number.to_s.chars
      result = number_ary.map.with_index{|number, index| send("r_digit_#{number_ary.length - index}", number.to_i)}.join
    end

    private

    def r_digit_1(number)
      Letter.new(number, 'I', 'V', 'X').translate
    end

    def r_digit_2(number)
      Letter.new(number, 'X', 'L', 'C').translate
    end

    def r_digit_3(number)
      Letter.new(number, 'C', 'D', 'M').translate
    end

    def r_digit_4(number)
      Letter.new(number, 'M', '', '').translate
    end
  end

  class Letter
    attr_reader :number, :first, :fifth, :tenth

    def initialize(number, first, fifth, tenth)
      @number = number
      @first = first
      @fifth = fifth
      @tenth = tenth
    end

    def translate
      case number
      when 1
        first
      when 2
        first * 2
      when 3
        first * 3
      when 4
        first + fifth
      when 5
        fifth
      when 6
        fifth + first
      when 7
        fifth + (first * 2)
      when 8
        fifth + (first * 3)
      when 9
        first + tenth
      when 10
        tenth
      else
        ''
      end
    end
  end
end
