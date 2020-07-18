class BankAccount
  
  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(money)
    @balance += money #+= means incrementing by money given 
  end
  
  def display_balance
    return "Your balance is $#{@balance}."
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
