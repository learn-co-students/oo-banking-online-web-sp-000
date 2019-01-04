require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount) 
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending" 
    
  end
  
  def valid? 
    
    @sender.valid? 
    @receiver.valid?
    
  end 
  
  def execute_transaction
    #binding.pry
    
    if self.status != "complete" 
      @sender.balance -= amount
      if @sender.valid? 
        @receiver.balance += amount 
        self.status = "complete"
      elsif !@sender.valid?
        self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
    
  end 
  
  def reverse_transfer
    
    if self.status == "complete"
      @sender.balance += amount 
      @receiver.balance -= amount
      self.status = "reversed"
    end 
    
  end 
  
  
  
  
  
end
