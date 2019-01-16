#!/usr/bin/env ruby
def factorial(n)
  return 1 if n == 1
  n * factorial(n - 1)
end
puts "Enter a number ?"
puts factorial(gets.to_i)