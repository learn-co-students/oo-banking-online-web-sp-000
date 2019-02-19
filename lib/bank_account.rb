class BankAccount
  attr_reader :name
  attr_accessor :balance, :status 
  
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end
  
  def deposit(amount)
    if amount >= 0
      @balance += amount
    end
  end
  
  def withdraw(amount)
    if self.valid? && @balance >= amount && amount > 0
      @balance -= amount
    end
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    @status == "open" && @balance > 0
  end
  
  def close_account
    @status = "closed"
  end
end
