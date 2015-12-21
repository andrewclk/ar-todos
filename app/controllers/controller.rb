require_relative '../../config/application'
require 'byebug'

class Controller < ActiveRecord::Base
	def self.inputlah(text)
		input = text.first
		text.shift

		case input
		when "add"
			# byebug
			n = List.count + 1 
			new_task = text.join(" ")
			List.create(number: n, task_name: new_task, status: 0)
			# byebug
			Output.added
			Output.list_all

		when "delete"
			task_num = text
			if List.find_by(number: task_num)  == nil
				puts "The item that you wanted to delete is not existed in this list!"
			else
				List.delete_all(number: task_num) 
				Output.deleted
				Output.list_all
			end

		when "complete"
			b = text[0]
			a = List.find_by(number: b)
			# byebug
			if a == nil
				puts "The item that you wanted to update is not existed in this list!"
			else
				# a.id = b
				# byebug
				a.update(status: true)
				Output.completed
			end 
		when "update"
			b = text[0]
			text.shift
			c = text.join(" ")
			a = List.find_by(number: b)
	
			if a == nil
				puts "The item that you wanted to update is not existed in this list!"
			else
				# a.id = b
				a.update(task_name: c)
				Output.updated
				Output.list_all
			end 
		when "list"
			Output.list_all
		else
			puts "Wrong command input. Please try again!"
		end
	end
end