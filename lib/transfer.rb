class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  def valid?
    if @sender.valid? && @receiver.valid? && @amount < @sender.balance
      true
    else
      false
    end
  end
  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender.balance = self.sender.balance - @amount
      self.receiver.balance = self.receiver.balance + @amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance = self.sender.balance + @amount
      self.receiver.balance = self.receiver.balance - @amount
      self.status = "reversed"
    end
  end
end
