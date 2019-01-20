white_array = Array.new
white_data = File.read('./assets/CAH-whites.txt')
white_data.each_line {|line| white_array << line.strip unless line == "\n"}
puts "The white deck contains #{white_array.length} cards"

return white_array

