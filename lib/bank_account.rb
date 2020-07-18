require_relative 'transfer'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(account, balance = 1000, status = "open")
    @name = account
    @balance = balance
    @status = status
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end
end