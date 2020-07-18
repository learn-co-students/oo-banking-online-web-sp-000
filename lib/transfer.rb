class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status != "complete"
      if sender.balance < self.amount
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
      receiver.deposit(self.amount)
      sender.balance -= self.amount
    end
    self.status = "complete"
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(self.amount)
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
