require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status 
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
    if @sender.balance > @amount 
      @sender.deposit(0-@amount)
      @receiver.deposit(@amount)
      @amount = 0
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
      
  end
  
end
