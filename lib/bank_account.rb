class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name, @balance, @status = name, 1000, "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.balance = 0
    self.status = "closed"
  end
end
