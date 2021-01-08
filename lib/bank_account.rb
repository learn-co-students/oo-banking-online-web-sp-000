class BankAccount
  attr_accessor :balance, :status, :display_balance
  attr_reader :name 
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance += money
  end 
  
  def withdrawal(money)
      @balance -= money
  end

  def display_balance
    p "Your balance is $#{self.balance}."
  end
  
  def valid?
    if self.status == "open" && self.balance > 0 
      return true 
    else 
      return false 
    end 
  end 
  
  def close_account
    @balance = 0 
    @status = "closed"
  end 

end
