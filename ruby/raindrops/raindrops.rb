class Raindrops
  VERSION = 1
  class << self
    def convert(number)
      dict = {
               3 => 'Pling',
               5 => 'Plang',
               7 => 'Plong'
      }

      result = dict.keys.inject(''){|sum, n| (number % n == 0) ? sum.concat(dict[n]) : sum} 
      handle_convert(result, number)
    end

    private

    def handle_convert(result, number)
      result == '' ? number.to_s : result
    end
  end
end
