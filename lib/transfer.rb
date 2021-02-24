class Transfer
  attr_accessor :sender, :receiver 

   def initialize(sender, receiver, amount=50)
   @sender = sender
   @receiver = receiver 
   @amount = amount
   @status = "pending"
  end 
 
  def status 
   @status
  end 
  
  def amount 
    @amount 
  end 
  
  def valid?
    if @status == "open" && @amount > 0
    return true
    else 
    return false 
    binding.pry 
    end
    
    if valid? && bank_account.valid?
    else 
     puts "there is a problem"
    end 
  end 
  
   
  def execute_transaction
  end 
  
end
