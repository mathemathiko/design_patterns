class Payroll
  def update(changed_employee)
    puts "We will send a check to #{changed_employee.name}."
    puts "His / Her salary is #{changed_employee.salary}."
  end
end

class Employee
  attr_reader :name, :salary

  def initialize(name, title, salary, payroll)
    @name    = name
    @title   = title
    @salary  = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self)
  end
end

payroll = Payroll.new
fred = Employee.new("Fred", "Crane Operator", 30000, payroll)
fred.salary = 35000
