class Squares
  VERSION = 2

  attr_reader :n

  def initialize(n)
    @n = n
  end

  def square_of_sum
    return 0 if n == 0
    (1..n).reduce(:+)**2
  end

  def sum_of_squares
    return 0 if n == 0
    (1..n).inject(0){|sum, n| sum + n**2}
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
