require 'pry'
class Transfer 
  attr_accessor :amount, :status, :sender, :receiver
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end 
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end 
  end 
   
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance = sender.balance - self.amount
      receiver.balance = receiver.deposit(self.amount)
      self.status = "complete"
    else 
        self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    end 
  end 
  
end
