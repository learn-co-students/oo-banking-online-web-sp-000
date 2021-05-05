require 'pry'

class Transfer
  attr_accessor :status, :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
    if sender.valid? && receiver.valid? 
      true 
    end
  end 
  
  def execute_transaction
    if valid? && sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if self.execute_transaction
      @receiver.balance -= @amount 
      @sender.balance += @amount 
      @status = "reversed"
    end 
  end
end
