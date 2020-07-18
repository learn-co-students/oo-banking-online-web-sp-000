class Transfer
  attr_accessor :status
  attr_reader :amount, :receiver, :sender

  def initialize (sender, receiver, amount)
    @amount = amount
    @status = 'pending'
    @sender = sender
    @receiver = receiver
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && amount < sender.balance && self.status == "pending"
        receiver.balance += amount
        sender.balance -= amount
        self.status = "complete"
      else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status==="complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
