class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = 'open'
  end 
  
  def deposit(amount)
    @balance += amount 
  end 
  
  def display_balance
    return "Your balance is $#{@balance}." 
  end 
  
  def valid? 
    return true if self.balance > 0 && self.status == 'open'    
    return false 
  end 
  
  def close_account 
    @status = 'closed'
    @balance = 0 
  end 

end
