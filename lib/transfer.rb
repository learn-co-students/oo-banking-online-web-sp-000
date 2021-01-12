class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount, status="pending")
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
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  def reverse_transfer
    if execute_transaction
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end
end 
