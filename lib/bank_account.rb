class BankAccount
  attr_accessor  :balance, :status
  attr_reader :name 
  
  @@deposit_value = 0
  
  def initialize(name)
    @name = name 
    @balance = 1000 
    @status = "open"
  end 
  
  def deposit(num)
    @balance = @balance + num
  end 
  
  def display_balance
    "Your balance is $#{self.balance}."
  end 
  
  def valid? 
    if balance > 0 && status != "closed"
      true 
    else false 
    end 
  end 
  
  def broke?
    if balance = 0 
      true 
    end 
  end 
  
  def close_account 
    self.status = "closed"
  end 

end
