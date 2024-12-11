# --- Day 2: Red-Nosed Reports ---
# Fortunately, the first location The Historians want to search isn't a long walk from the Chief Historian's 
# office.

# While the Red-Nosed Reindeer nuclear fusion/fission plant appears to contain no sign of the Chief Historian, 
# the engineers there run up to you as soon as they see you. Apparently, they still talk about the time Rudolph 
# was saved through molecular synthesis from a single electron.

# They're quick to add that - since you're already here - they'd really appreciate your help analyzing some unusual 
# data from the Red-Nosed reactor. You turn to check if The Historians are waiting for you, but they seem to have 
# already divided into groups that are currently searching every corner of the facility. You offer to help with 
# the unusual data.

# The unusual data (your puzzle input) consists of many reports, one report per line. Each report is a list of 
# numbers called levels that are separated by spaces. For example:

# 7 6 4 2 1
# 1 2 7 8 9
# 9 7 6 2 1
# 1 3 2 4 5
# 8 6 4 4 1
# 1 3 6 7 9

# This example data contains six reports each containing five levels.

# The engineers are trying to figure out which reports are safe. The Red-Nosed reactor safety systems can only tolerate 
# levels that are either gradually increasing or gradually decreasing. So, a report only counts as safe if both of the 
# following are true:

# The levels are either all increasing or all decreasing.
# Any two adjacent levels differ by at least one and at most three.
# In the example above, the reports can be found safe or unsafe by checking those rules:

# 7 6 4 2 1: Safe because the levels are all decreasing by 1 or 2.
# 1 2 7 8 9: Unsafe because 2 7 is an increase of 5.
# 9 7 6 2 1: Unsafe because 6 2 is a decrease of 4.
# 1 3 2 4 5: Unsafe because 1 3 is increasing but 3 2 is decreasing.
# 8 6 4 4 1: Unsafe because 4 4 is neither an increase or a decrease.
# 1 3 6 7 9: Safe because the levels are all increasing by 1, 2, or 3.
# So, in this example, 2 reports are safe.

# Analyze the unusual data from the engineers. How many reports are safe?


########### SOLUTION ###########

# 1. Check if all numbers are ascending
#    If ascending, safe_count + 1
# 2. If not ascending, check if all numbers are descending
#    If descending, safe_count + 1
# 3. If ascending or descending, check difference between consecutive number <= 3 
# 4. It not ascending or descending, do nothing

def is_ascending(arr)
  asc = []
  puts "arr: #{arr}"
  i = 0

  while i < (arr.length - 1)
    arr[i] < arr[i+1] ? asc.push(true) : asc.push(false)
    i +=1
  end
  puts "asc: #{asc}"
end

def is_descending(arr)
  desc = []
  puts "arr: #{arr}"
  i = 0

  while i < (arr.length - 1)
    arr[i+1] < arr[i] ? desc.push(true) : desc.push(false)
    i +=1
  end
  puts "desc: #{desc}"
end

def difference(arr)
  diff = []
  puts "arr: #{arr}"
  i = 0

  while i < (arr.length - 1)
    (arr[i+1] - arr[i]).abs <= 3 ? diff.push(true) : diff.push(false)
    i +=1
  end
  puts "diff: #{diff}"
end


levels = []
int_levels = []
difference = []
safe_count = 0


# Read each line from file and put into array
File.readlines('input.txt').each do |line|
  levels = line.split(' ')
  int_levels = levels.map { |l| l.to_i }
  puts "levels: #{int_levels}"

  puts levels.class
  is_ascending(int_levels)
  is_descending(int_levels)
  difference(int_levels)

=begin
  while index <= levels.length
    (levels[index].to_i > levels[index-1].to_i) ? difference.push(true) : difference.push(false)
    puts "difference1: #{difference}"

    puts "difference.include?(false)1: #{difference.include?(false)}"
    puts "safe_count1: #{safe_count}"
    unless difference.include?(false) 
      ((((levels[index].to_i - levels[index-1].to_i)) <= 3) && ((levels[index].to_i - levels[index-1].to_i) > 0)) ? difference.push(true) : difference.push(false)
      puts "difference2: #{difference}"

      puts "safe_count2: #{safe_count}"
      puts "difference2.include?(false): #{difference.include?(false)}"
      # unless difference.include?(false)
      #   safe_count +=1
      # end
    end
    # if difference.include?(false)
    #   safe_count +=1
    # end
    index +=1
  end
  safe_count +=1 unless difference.include?(false)
  # levels.each_with_index do |level, index|
  #   if level
=end
end

# puts safe_count
