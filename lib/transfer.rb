class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    end
    return false
  end

  def execute_transaction
    if self.status == "pending"
      if self.valid?
        if self.sender.balance >= self.amount
          self.status = "complete"
          self.receiver.deposit(self.amount)
          self.sender.balance -= self.amount
        else
          self.status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
