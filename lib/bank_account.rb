class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
  end

  def deposit(amount)
    @balance += amount
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def close_account
    @status = "closed"
  end
end
