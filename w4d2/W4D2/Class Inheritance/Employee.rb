# require_relative "Manager.rb"
require "byebug"

class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss    
        if @boss != nil 
            @boss.employees << self
        end
    end


    def bonus(multiplier)
        salary * multiplier
    end


end