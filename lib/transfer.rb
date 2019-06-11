class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      # if self.sender.valid?
        self.sender.withdraw(self.amount)
        self.receiver.deposit(self.amount)
        self.status = "complete"
      # else
        # "Transaction rejected. Please check your account balance."
      # end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
