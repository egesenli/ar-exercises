require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Find the stores
@store1 = Store.find(1)
@store2 = Store.find(2)

# Update the stores
@store1.name = "Erkan's Store"

# Save the stores
@store1.save