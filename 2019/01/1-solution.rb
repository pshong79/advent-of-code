# ## SOLUTION 1: Find the total mass of the rocket before finding the required fuel.
# def rocket_mass(filename)
#   mass = 0
#   File.readlines(filename).each do |line|
#     mass = mass + line.to_i
#  end
#  return mass
# end

# def fuel_required
#   mass = rocket_mass("input.txt")
#   total_fuel = ((mass / 3).floor) - 2
#   puts total_fuel
# end

# ## Run solution. Returns "3295437"
# fuel_required


## SOLUTION 2: Find the fuel required for each part and then add it up.
def fuel_required(filename)
  total_fuel = 0
  File.readlines(filename).each do |line|
    mass = line.to_i
    # Calculates fuel needed per part
    fuel_needed = ((mass / 3).floor) - 2
    # Sum of fuel
    total_fuel = total_fuel + fuel_needed
  end
  puts total_fuel
end

## Run solution. Returns "3295206"
fuel_required("input.txt")


### NOTE: Solution 2 is the solution that meets the criteria of the problem.