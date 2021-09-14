# Borrowed from 1-solution.rb

def fuel_required(filename)
  total_fuel_for_parts = 0
  total_fuel_for_fuel = 0

  File.readlines(filename).each do |line|
    mass = line.to_i
    # Calculates fuel needed per part
    fuel_needed = ((mass / 3).floor) - 2
    # Calculate fuel needed for the fuel for the part
    if (fuel_needed / 3 )
    fuel_for_fuel = ((fuel_needed) / 3).floor) - 2
    # Sum of fuel
    # total_fuel = total_fuel + fuel_needed
  end
  # puts total_fuel
end