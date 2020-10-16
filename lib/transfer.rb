class Transfer
attr_accessor :sender, :receiver, :status, :amount

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
   if valid? && sender.balance > amount && @status == "pending"
    receiver.balance = receiver.balance + amount
    sender.balance = sender.balance - amount
    @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if valid? && @status == "complete"
    receiver.balance = receiver.balance - amount
    sender.balance = sender.balance + amount
    @status = "reversed"
  end
end

end
