class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= self.amount
  end

  def execute_transaction
    if self.valid? && self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else !self.valid?
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
