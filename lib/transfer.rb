require 'pry'
class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
  @counter = 0
  end
  
  def valid?
    if sender.valid? && receiver.valid? 
      true
    else
      false
    end
  end
  
  def execute_transaction
    if (receiver.status != 'closed' && sender.status != 'closed') && sender.balance >= amount
      while @counter < 1
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      @counter += 1
      end
    else 
      #binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
  
end
