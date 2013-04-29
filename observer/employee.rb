module Subject
  def initialize
    @observers = []
  end

  def add_observer(&observer)
    @observers << observer
  end

  def delete_observer(&observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.call(self)
    end
  end
end

class Employee
  include Subject

  attr_reader :name, :salary

  def initialize(name, title, salary)
    super()
    @name   = name
    @title  = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

fred = Employee.new("Fred", "Crane Operator", 30000)

fred.add_observer do |changed_employee|
  puts "We will send a check to #{changed_employee.name}."
  puts "His / Her salary is #{changed_employee.salary}."
end

fred.add_observer do |changed_employee|
  puts "We will send a sales invoice sheet for new tax to #{changed_employee.name}."
end

fred.salary = 35000
