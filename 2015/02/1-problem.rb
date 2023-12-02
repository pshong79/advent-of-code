# --- Day 2: I Was Told There Would Be No Math ---
# The elves are running low on wrapping paper, and so they need to submit an order for more. 
# They have a list of the dimensions (length l, width w, and height h) of each present, and only want to order exactly 
# as much as they need.

# Fortunately, every present is a box (a perfect right rectangular prism), which makes calculating the 
# required wrapping paper for each gift a little easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. 
# The elves also need a little extra paper for each present: the area of the smallest side.

# For example:

# A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of wrapping paper plus 6 square feet of slack, for a total of 58 square feet.
# A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet of wrapping paper plus 1 square foot of slack, for a total of 43 square feet.
# All numbers in the elves' list are in feet. How many total square feet of wrapping paper should they order?


########### SOLUTION ###########

def read_input(filename)
  arr = File.readlines(filename)

  return arr
end

def format_dimension_value(arr_of_dimensions)
  arr_of_dimensions.strip.split('x')
end

def calculate_surface_area(length, width, height)
  sides = []
  side_1_surface_area = 2 * length * width
  side_2_surface_area = 2 * width * height
  side_3_surface_area = 2 * height * length

  sides.push(side_1_surface_area)
  sides.push(side_2_surface_area)
  sides.push(side_3_surface_area)

  total_surface_area = sides.sum
  # divide smallest_side by 2 because calculate_surface_area calculates for 2 sides
  smallest_side = sides.min / 2 
  
  return total_surface_area, smallest_side
end

def wrapping_paper_per_present(total_surface_area, smallest_side)
  total_surface_area + smallest_side
end

def calculate_total_sq_ft_of_wrapping_paper
  dimensions_of_presents = read_input("input.txt")

  total_sq_ft_of_wrapping_paper = dimensions_of_presents.map do |present|
    length, width, height = format_dimension_value(present).each_with_index { |dim, i| dim[i] }
    total_surface_area, smallest_area = calculate_surface_area(length.to_i, width.to_i, height.to_i)
    wrapping_paper_per_present(total_surface_area, smallest_area)
  end

  puts "Total square feet of wrapping paper needed = #{total_sq_ft_of_wrapping_paper.sum}"
  total_sq_ft_of_wrapping_paper.sum
end


## Run solution. Answer = 1588178
calculate_total_sq_ft_of_wrapping_paper
