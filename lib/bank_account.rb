class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    if self.valid?
      self.balance = self.balance + amount
    end
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status != "closed" && self.balance > 0
      true
    else 
      false
    end
  end

  def close_account
    self.status = "closed"
  end

end
