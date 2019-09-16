require "pry"

class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize (name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

end
