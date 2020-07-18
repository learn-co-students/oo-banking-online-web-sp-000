require "pry"
class Transfer
  
  attr_accessor :status, :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end
  
  def valid?()
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction()
    if valid? && sender.balance > amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer()
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
  
end
