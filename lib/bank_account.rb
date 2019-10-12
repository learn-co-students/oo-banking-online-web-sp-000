class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    #can deposit into account
    @balance += amount
  end

  def display_balance
    #can display balance
    "Your balance is $#{@balance}."
  end

  def valid?
    #valid if open and balance greater than 0
    @status.include?("open") && @balance > 0
  end

  def close_account
    #can close account
    @status = "closed"
  end

end
