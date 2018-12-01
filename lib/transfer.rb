class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @status = "pending"
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  def execute_transaction

    if self.status == "complete"
      "complete"
    elsif @sender.balance < @amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      self.status = "reversed"
    end
  end
end
