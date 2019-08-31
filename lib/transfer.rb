class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status != "complete"
      if self.sender.status == "closed" || self.receiver.status == "closed" || self.sender.balance < self.amount
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        self.receiver.balance += self.amount
        self.sender.balance -= self.amount
        self.status = "complete"
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
