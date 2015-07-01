
triangular_number = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count += 1
    puts "The 1 Iterator: #{number}"
    yielder.yield number
  end
end

class Enumerator
  def infinite_select(&block)
    Enumerator.new do |yielder|
      self.each do |value|
        puts "select #{value}"
        if block.call value
          yielder.yield value
        end
      end
    end
  end
end

p triangular_number
      .infinite_select { |val| puts "in select 1"; val % 10 == 0 }
      .infinite_select { |val| puts "in select 2"; val.to_s =~ /3/ }
      .first(1)

triangular_number.first 10

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end

def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield(n += 1)}
  end.lazy
end

p Integer
        .all
        .select {|i| (i % 3).zero? }
        .select {|i| palindrome?(i) }
        .first(10)


