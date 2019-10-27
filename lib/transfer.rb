class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" and valid? and receiver.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_tansfer
    end

  end

  def reverse_transfer
    if self.status == "complete" and valid? and receiver.balance > amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_tansfer
    end
  end

  def reject_tansfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
