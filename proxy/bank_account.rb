class BankAccount
  attr_reader :balance

  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class BankAccountProxy
  def initialize(real_object)
    @real_object = real_object
  end

  def method_missing(name, *args)
    puts "Delegating #{name} message to real_object."
    @real_object.__send__ name, args
  end
end

account = BankAccount.new(100)
account.deposit(50)
account.withdraw(10)

proxy = BankAccountProxy.new(account)
proxy.deposit(50)
proxy.withdraw(10)

class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject    = real_account
    @owner_name = owner_name
  end

  def method_missing(name, *args)
    check_access
    @subject.__send__ name, args
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{Etc.getlogin} cannot access account."
    end
  end
end

class VisualAccountProxy
  def initialize(starting_balance = 0, &creation_block)
    @starting_balance = starting_balance
    @creation_block   = creation_block
  end

  def method_missing(name, *args)
    s = subject
    s.__send__ name, args
  end

  def subject
    @subject ||= @creation_block.call
  end
end
