class BankAccount
  attr_accessor :status, :balance
  attr_reader :name
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end
  def deposit(amount)
    @balance += amount
  end
  def withdraw(amount)
    @balance = @balance - amount
  end
  def display_balance
    "Your balance is $#{self.balance}."
  end
  def valid?
    if self.balance > 0 && self.status == "open"
      true
    else
      false
    end
  end
  def close_account
    self.status = "closed"
  end
end
