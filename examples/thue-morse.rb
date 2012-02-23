require 'oeis'

## Thue-Morse Sequence
##    Starting with a single-element array of 0, continuously add the "inverse" of the array
##    0 -> 01 -> 0110 -> 01101001 -> ...

seq = [0]
a = 1

4.times do
  0.upto(a-1) do |i|
    seq << ((seq[i] == 0) ? 1 : 0)
  end
  a *= 2
end

res = OEIS::search(seq)
puts "#{res.id}: #{res.title}"