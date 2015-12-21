require_relative '../../config/application'

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.integer :number
    	t.boolean :status
    	t.string :task_name
    	t.datetime :created_at, :updated_at
    end
  end
end