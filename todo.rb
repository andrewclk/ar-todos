require_relative 'config/application'
require_relative 'app/controllers/controller'
require_relative 'app/viewers/output'
require 'byebug'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

input = ARGV #ARGV is a default array

Controller.inputlah(input)
Output.new_one
