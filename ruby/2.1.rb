# Set up array
arr = []
(0...16).each { |i| arr[i] = i }

# please god tell me there's a better way to do this 😭
arr.each { |i| print "#{arr[i]} #{((i + 1) % 4).zero? ? "\n" : ''}" }

puts '--------------------'

# Print four numbers at a time, using each_slice
arr.each_slice(4).each { |x| puts x.join(' ') }
