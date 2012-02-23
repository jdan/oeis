require 'oeis'

numbers = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
res = OEIS::search(numbers.collect { |item| item.length })

puts "#{res.id}: #{res.title}"
puts res.sequence[0..30].inspect
