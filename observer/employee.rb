class Payroll
  def update(changed_employee)
    puts "We will send a check to #{changed_employee.name}."
    puts "His / Her salary is #{changed_employee.salary}."
  end
end

class Employee
  attr_reader :name, :salary

  def initialize(name, title, salary)
    @name      = name
    @title     = title
    @salary    = salary
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

fred = Employee.new("Fred", "Crane Operator", 30000)

payroll = Payroll.new
fred.add_observer(payroll)

fred.salary = 35000
