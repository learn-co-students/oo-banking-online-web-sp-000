require 'pry'
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if self.balance > 0 && self.status != "closed"
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
    self.balance = 0
  end

end
