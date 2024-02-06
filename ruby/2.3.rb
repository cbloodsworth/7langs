def my_grep(filename, token)
  File.readlines(filename).each do |line|
    puts line if line.match(token)
  end
end

my_grep('my_text.txt', 'multiple')