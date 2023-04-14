require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Inside Store class
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_apparel

  private

  def must_carry_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "must carry at least one of the men's or women's apparel")
      errors.add(:womens_apparel, "must carry at least one of the men's or women's apparel")
    end
  end
end

# Inside Employee class
class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates_associated :store
end

# Ask user for a store name
puts "Please enter a store name:"
store_name = gets.chomp

# Attempt to create a store and display errors
store = Store.new(name: store_name)
if store.save
  puts "Store #{store.name} saved successfully!"
else
  puts "Unable to save store: #{store.errors.full_messages.join(", ")}"
end
