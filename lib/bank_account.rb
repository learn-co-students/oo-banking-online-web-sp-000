require 'pry'

class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name=(name)
    @balance = 1000
    @status = "open"
  end

  def name=(name)
    raise NameChangeError, "Cannot change account holder name." if !@name.is frozen?
    @name = name
    @name.freeze!
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end

class NameChangeError < TypeError; end
