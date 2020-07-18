require "pry"

class Transfer
  
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid? && self.sender.balance > @amount
      return true 
    else
      return false
    end
  end
  
  def execute_transaction
    if self.valid? && status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      @status = "complete"
      
      else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
 
  
    
end
