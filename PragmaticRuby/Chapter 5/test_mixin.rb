
module Debug
  def who_am_i?
    "#{self.class.name} (id: #{self.object_id}): #{self.name}"
  end
end


class Phonograph
  include Debug

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class EightTrack
  include Debug
  attr_reader :name

  def initialize(name)
    @name = name
  end
end


ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")

puts ph.who_am_i?
puts et.who_am_i?

class VowelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end

  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel
    end
  end
end

vf = VowelFinder.new("the quick brown fox jumped")
puts vf.inject(:+)

puts vf.instance_of? Enumerable