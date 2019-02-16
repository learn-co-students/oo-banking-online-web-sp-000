class Transfer
    attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

    if valid? && amount < @sender.balance && self.status == "pending"
      sender.balance = sender.balance - amount
      receiver.deposit(amount)
      self.status = "complete"
    else
   self.status = "rejected"
   "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status != "pending"
      receiver.balance = receiver.balance - amount
      sender.deposit(amount)
      self.status = "reversed"
    end
  end



end
