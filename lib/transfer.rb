require 'pry'

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
    if (@status == "open" || "pending") && @amount >0 && sender.valid? && receiver.valid?
    true
    else 
     puts "There is a problem with one of the accounts." 
     false 
    end
  end 
  
   
  def execute_transaction
    if sender.balance > amount && valid? && self.status == "pending" 
      sender.balance = sender.balance - amount  
     receiver.balance = receiver.balance + amount 
     @status = "complete"
  else 
     @status = "rejected"
    "Transaction rejected. Please check your account balance." 
  end 
end 

def reverse_transfer 
  if @status == "complete" || !"reversed"
    sender.balance = sender.balance + amount
    receiver.balance = receiver.balance - amount
    @status = "reversed"
end 
end 
end 