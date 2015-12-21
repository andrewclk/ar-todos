require_relative '../../config/application'

class Output < ActiveRecord::Base

	def self.list_all
		puts "These are the tasks in your to-do list:"
		puts "---------------------------------------\n"

		List.all.each_with_index do | num, index|
			num.update(number: index+1)
			num.id = index+1
			if num.status == true
			puts "[x] #{num.number}. #{num.task_name}"
			else
			puts "[ ] #{num.number}. #{num.task_name}"
			end
		end
	end

	def self.added
		puts "A new task has been added!"
	end

	def self.deleted
		puts "It has been deleted!"
	end

	def self.updated
		puts "It has been updated!"
	end

	def self.completed
		puts "It has been completed!"
	end

	def self.new_one
		puts "============================"
		puts "Start with one of these commands:"
		puts "list, add #text, delete #task number, update #task number or complete #task number #new task name"
	end

end
