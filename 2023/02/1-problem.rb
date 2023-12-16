# --- Day 2: Cube Conundrum ---
# You're launched high into the atmosphere! The apex of your trajectory just barely reaches the 
# surface of a large island floating in the sky. You gently land in a fluffy pile of leaves. 
# It's quite cold, but you don't see much snow. An Elf runs over to greet you.

# The Elf explains that you've arrived at Snow Island and apologizes for the lack of snow. He'll be happy to 
# explain the situation, but it's a bit of a walk, so you have some time. They don't get many visitors 
# up here; would you like to play a game in the meantime?

# As you walk, the Elf shows you a small bag and some cubes which are either red, green, or blue. 
# Each time you play this game, he will hide a secret number of cubes of each color in the bag, 
# and your goal is to figure out information about the number of cubes.

# To get information, once a bag has been loaded with cubes, the Elf will reach into the bag, grab a 
# handful of random cubes, show them to you, and then put them back in the bag. He'll do this a few times per game.

# You play several games and record the information from each game (your puzzle input). Each game is listed with its 
# ID number (like the 11 in Game 11: ...) followed by a semicolon-separated list of subsets of cubes that were 
# revealed from the bag (like 3 red, 5 green, 4 blue).

# For example, the record of a few games might look like this:

# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
# Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
# Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
# Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
# Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

# In game 1, three sets of cubes are revealed from the bag (and then put back again). The first set is 3 blue cubes 
# and 4 red cubes; the second set is 1 red cube, 2 green cubes, and 6 blue cubes; the third set is only 2 green cubes.

# The Elf would first like to know which games would have been possible if the bag contained only 12 red cubes, 
# 13 green cubes, and 14 blue cubes?

# In the example above, games 1, 2, and 5 would have been possible if the bag had been loaded with that configuration. 
# However, game 3 would have been impossible because at one point the Elf showed you 20 red cubes at once; similarly, 
# game 4 would also have been impossible because the Elf showed you 15 blue cubes at once. If you add up the IDs of the 
# games that would have been possible, you get 8.

# Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, 
# and 14 blue cubes. What is the sum of the IDs of those games?


########### SOLUTION ###########

#TODO: refactor
def read_input(filename)
  full_array = []

  arr = File.readlines(filename)
  full_array = arr.map do |str|
    str.chomp.split(";")
  end

  full_array
end

def calculate_sum_of_valid_games(arr)
  dice_set = {
    red: 12,
    green: 13,
    blue: 14
  }
  game_possible = []

  arr.map do |line| 
    game_num = []
    bool_arr = []
    
    line.map do |str|
      green_arr = []
      blue_arr = []
      red_arr = []

      y = str.gsub(":", ",").split(",")
      y.map do |word|
        z = word.delete(' ').split(/\W/)
        z.map do |xyz|
          q = xyz.split(/(\D+)/)
          case q[1]
            when "green"
              green_arr << q[0].to_i
            when "red"
              red_arr << q[0].to_i
            when "blue"
              blue_arr << q[0].to_i
            when "Game"
              game_num << q[2].to_i
          end
          
        end
        
      end
      total_red = red_arr.sum
      total_green = green_arr.sum
      total_blue = blue_arr.sum

      flag = total_red <= dice_set[:red] && total_green <= dice_set[:green] && total_blue <= dice_set[:blue]
      bool_arr << flag
    end
    
    unless (bool_arr.uniq.include?(false))
      game_possible.push(game_num).flatten(1).uniq
    end
  end
  
  game_possible.flatten(1).sum
end

## Run solution. Answer = 2085
split_into_array = read_input("input.txt")
calculate_sum_of_valid_games(split_into_array)
sum_of_games = calculate_sum_of_valid_games(split_into_array)
puts "Answer = #{sum_of_games}"
