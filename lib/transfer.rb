class Transfer

  attr_accessor :sender, :receiver, :status, :name, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance < @amount || !valid? || self.status == "complete"
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      self.status = "complete"
      sender.deposit(@amount * -1)
      receiver.deposit(@amount)
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(@amount)
      receiver.deposit(@amount * -1)
      self.status = "reversed"
    end
  end
end
