class BankAccount
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def name
    @name
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def withdraw(amount)
    @balance -= amount
  end
  
  def display_balance
   "Your balance is $#{@balance}."
  end
  
  def balance
    @balance
  end
  
  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end
  
  def close_account
    @status = "closed"
  end
end
