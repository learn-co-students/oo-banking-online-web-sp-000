require "pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
    #sender = amanda, receiver = avi, status = open, amount = 1000
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender 
    @receiver = receiver
    @status = status
    @amount = amount
  end 
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true 
    else 
      false 
    end 
  end 
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
    # if valid?
    #   receiver.deposit(@amount) && sender.deposit(-@amount)
    #   @status = "complete"
    # else 
    #   "Transaction rejected. Please check your account balance."
    #   @status = "rejected"
    
    def reverse_transfer
      if @status == "complete" 
        @status = "reversed"
        @receiver.balance -= @amount
        @sender.balance += @amount
      end 
    end 
end
