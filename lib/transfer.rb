require "pry"
class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    if self.sender.valid? == false || self.sender.balance < @amount
      @status = "rejected"
     return "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
    self.receiver.deposit(@amount)
    self.sender.withdraw(@amount)
    @status = "complete"
  end
end

def reverse_transfer
  if @status == "complete"
  self.sender.deposit(@amount)
  self.receiver.withdraw(@amount)
  @status = "reversed"
end
end

end
