# Set up array
arr = []
(0...16).each { |i| arr[i] = i }

# Print four numbers at a time, only using each
def newline_char(i)

end

# please god tell me there's a better way to do this 😭
arr.each{ |i| print "#{arr[i]} #{(i+1) % 4 == 0 ? "\n" : ""}"}

puts '--------------------'

# Print four numbers at a time, using each_slice
arr.each_slice(4).each{|x| puts x.join(' ')}