class Payroll
  def update(changed_employee)
    puts "We will send a check to #{changed_employee.name}."
    puts "His / Her salary is #{changed_employee.salary}."
  end
end

class TaxMan
  def update(changed_employee)
    puts "We will send a sales invoice sheet for new tax to #{changed_employee.name}."
  end
end

class Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Employee < Subject
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

payroll = Payroll.new
fred.add_observer(payroll)

tax_man = TaxMan.new
fred.add_observer(tax_man)

fred.salary = 35000
