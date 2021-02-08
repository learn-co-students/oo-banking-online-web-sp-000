class Transfer
  attr_accessor :transfer, :sender, :amount, :receiver, :status, :balance

  def initialize(sender,receiver,amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender && receiver
      true
    else
      false
    end
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance >= amount && status == "pending"
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if valid? && @receiver.balance >= amount && status == "complete"
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
  end
end
end
