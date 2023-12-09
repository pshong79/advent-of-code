# --- Part Two ---
# Your calculation isn't quite right. It looks like some of the digits are actually spelled out with 
# letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

# Equipped with this new information, you now need to find the real first and last digit on each line. For example:

# two1nine
# eightwothree
# abcone2threexyz
# xtwone3four
# 4nineeightseven2
# zoneight234
# 7pqrstsixteen
# In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

# What is the sum of all of the calibration values?


########### SOLUTION ###########

#TODO: refactor
NUMBERS = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}

def get_line(filename)
  File.readlines(filename).map do |line|
    line.chomp
  end
end

def convert_string_to_digits(array_of_strings, keys)
  array_of_updated_words = []
  updated_words = []

  array_of_strings.map do |word|
    keys.map do |x|
      if word.include?(x)
        z = x.sub(x[1], NUMBERS[x].to_s)
        word = word.gsub(x, z)
        array_of_updated_words.push(word) unless word == nil
      elsif word == word.to_s
        z = x.sub(x[1], NUMBERS[x].to_s)
        word = word.gsub(x, z)
        array_of_updated_words.push(word) unless word == nil
      end  
    end

    updated_words.push(array_of_updated_words.last)
  end

  updated_words
end

def calculate_calibration_value(array_of_words)
  final_array = []

  array_of_words.map do |x|
    array_of_numbers = []
    word = x.split(//)
    word.each do |char| 
      char_int = char.to_i
      array_of_numbers.push(char_int) unless char_int == 0
    end

    array_of_numbers_length = array_of_numbers.length    
    if array_of_numbers_length >= 2
      a = array_of_numbers[0].to_s + array_of_numbers[-1].to_s
      final_array.push(a.to_i)
    elsif array_of_numbers_length == 1
      a = array_of_numbers[0].to_s + array_of_numbers[0].to_s
      final_array.push(a.to_i)
    else
      final_array.push(0)
    end
  end

  puts "Calibration Value = #{final_array.sum}"
  final_array.sum
end

## Run solution. Answer = 53340
arr_of_strings = get_line("input.txt")
transformed_word = convert_string_to_digits(arr_of_strings, NUMBERS.keys)
calculate_calibration_value(transformed_word)
