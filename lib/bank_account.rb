require "pry"
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = balance = 1000
    @status = status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
      return "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    elsif @status == "closed"
      false
    else @status == "broke"
      false
    end
  end
    def close_account
      @status = "closed"
    end
end
