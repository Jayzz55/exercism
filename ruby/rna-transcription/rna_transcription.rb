class Complement
  VERSION = 3
  def self.of_dna(string)
    dict = {
             'G' => 'C',
             'C' => 'G',
             'T' => 'A',
             'A' => 'U'
    }
    string.split('').map do |i| 
      raise ArgumentError unless dict.keys.include? i
      dict[i]
    end.join('')
  end
end
