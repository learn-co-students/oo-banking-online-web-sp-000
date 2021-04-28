require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :transferred_amount
  
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
    if valid? && @sender.balance >= @amount
      @sender.deposit(0-@amount)
      @receiver.deposit(@amount)
      @transferred_amount = @amount 
      @amount = 0
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@transferred_amount)
      @receiver.deposit(0-@transferred_amount)
      @status = "reversed"
    end
  end
  
end
