

File.open("range_test_file") do |file|
  file.each do |line|
    puts line if line =~ /start/ .. line =~ /end/
  end
end

car_age = gets.to_f

case car_age
  when 0...1
    puts "Mmm.. new car smell"
  when 1...3
    puts "Reilable but slightly dinged"
  when 10...30
    puts "Clunker"
  else
    puts "Vintage gem"
end

