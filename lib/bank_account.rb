require 'pry'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  balance = 1000

  def initialize(name)
  self.balance = 1000
  self.status = "open"
  @name = name
  end

  def deposit(money)
  self.balance = balance + money
  end

  def display_balance
   "Your balance is $#{balance}."
  end

  def valid?
  #  binding.pry
    if (self.status == "open") && (self.balance > 0)
      true
    elsif (self.status != "open") || (self.balance = 0)
      false
    end
  end

  def close_account
    self.status = "closed"
  end

end
