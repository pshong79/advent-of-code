# --- Day 1, Part 2: Not Quite Lisp ---
# Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor -1). 
# The first character in the instructions has position 1, the second character has position 2, and so on.

# For example:

# ) causes him to enter the basement at character position 1.
# ()()) causes him to enter the basement at character position 5.
# What is the position of the character that causes Santa to first enter the basement?


########### SOLUTION ###########

def basement_position(filename)
  floor = 1
  File.readlines(filename).first.split('').each_with_index do |line, index|
    line == '(' ? floor += 1 : floor -= 1
    if floor == -1
      puts index
      return
    end
  end
end

## Run solution. Answer = 1795
basement_position("input.txt")
