
Song = Struct.new(:title, :name, :length)
songs = []

File.open("songdata") do |song_file|
  song_file.each do |line|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ")
    mins, secs = length.scan(/\d+/)
    songs << Song.new(title, name, mins.to_i * 60 + secs.to_i)
  end
end

puts songs