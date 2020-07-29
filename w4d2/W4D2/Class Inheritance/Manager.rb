require_relative "Employee.rb"
require "byebug"

class Manager < Employee

    attr_accessor :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    # def bonus(multiplier)
    #     initial_bonus = 0
    #     needed_employees = @employees #queue
    #     until needed_employees.empty?
    #         next_employee = needed_employees.shift
    #         initial_bonus += next_employee.salary
    #         if next_employee.class == Manager
    #             next_employee.employees.each {|employee| needed_employees << employee}
    #         end
    #     end
    #     initial_bonus * multiplier
    # end

    def bonus(multiplier)
        total_bonus = self.salary * multiplier
        @employees.each {|employee| total_bonus += employee.bonus(multiplier)}
        total_bonus
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000