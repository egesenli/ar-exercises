require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

puts "Exercise 3"
puts "----------"

# Find the store
@store3 = Store.find(3)

# Delete the store
@store3.destroy

# Count the store
puts Store.count