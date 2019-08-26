class Taco < ApplicationRecord
  belongs_to :user
  
  validates :value, numericality: {
    greater_than_or_equal_to: 25,
    less_than_or_equal_to: 100, 
    message: "Must be at least 25 dollars and below 100 dollar"
  }
end
