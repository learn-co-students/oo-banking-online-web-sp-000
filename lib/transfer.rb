class Transfer

  attr_accessor :sender, :amount, :receiver, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending"
      if amount > sender.balance || sender.status == "closed" || receiver.status == "closed"
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      end
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
