class BankAccount
  attr_writer :balance, :status
  attr_reader :name, :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(x)
    @balance += x
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end
  
  def close_account
    @status = "closed"
  end
    
end
