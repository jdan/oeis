require 'oeis'

def digit_sum(n)
  if n < 10
    n
  else
    n % 10 + digit_sum(n / 10)
  end
end

res = OEIS::search(1.upto(30).map { |n| digit_sum(n) })

puts "#{res.id}: #{res.title}"
puts res.sequence[0..30].inspect