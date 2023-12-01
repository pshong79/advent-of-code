def count_floor(filename)
  floor = 0
  File.readlines(filename).first.split('').each do |line|
    line == '(' ? floor += 1 : floor -= 1
  end

  puts floor
end

# ## Run solution. Answer = 74
count_floor("input.txt")
