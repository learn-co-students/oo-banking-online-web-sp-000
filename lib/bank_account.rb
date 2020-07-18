class BankAccount
  attr_accessor :name, :status, :balance 
   


  def initialize(name, status = "open")
    @name = name
    @balance = 1000
    @status = status
    
  end
  
  def name=(name)
    @name = name 
   raise Exception if !name.nil?
  end 
  
  def deposit(amount)
    @balance = @balance + (amount)
  end 
  
  def display_balance
    "Your balance is $#{@balance}."
  end 

def valid?
  if @status != "open" 
    false 
  elsif @balance <= 0
    false 
  else 
    true 
  end
end
 
 def close_account
   @status = "closed"
   @balance = 0 
 end

end
