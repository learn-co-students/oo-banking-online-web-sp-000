class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    receiver.valid? && sender.valid? 
  end

  def execute_transaction
    if self.valid? && sender.balance > self.amount && self.status == "pending" 
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
     self.status = "rejected"
     return "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
     end
  end
end
