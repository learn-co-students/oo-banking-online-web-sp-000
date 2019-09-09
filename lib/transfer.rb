class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    elsif
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && self.status == "complete" && self.receiver.balance > amount
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
