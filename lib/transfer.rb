require 'pry'
class Transfer
  attr_accessor :amount, :status, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end 
  
  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      @receiver.deposit(@amount)
      @sender.deposit( @amount * -1 ) 
      @status = "complete"
      #binding.pry
    elsif @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
      if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
    
  
end
