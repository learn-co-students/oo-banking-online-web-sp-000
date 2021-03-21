class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if
      valid? && sender.balance > @amount && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      rejects_transfer
    end
  end

  def reverse_transfer
    if
      valid? && receiver.balance > @amount && self.status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      self.status = "reversed"
    else
      rejects_transfer
    end
  end

  def rejects_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
