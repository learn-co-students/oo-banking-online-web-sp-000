class BankAccount
#resubmitting for v8

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(cash)
    @balance += cash
  end
  
  def withdraw(cash)
    @balance -= cash
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0 ? true : false
  end
  
  def close_account
    self.status = "closed"
  end

end
