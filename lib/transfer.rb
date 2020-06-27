class Transfer

attr_reader :sender, :receiver, :amount
attr_accessor :status

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
if @sender.valid? && @receiver.valid? && (@sender.balance >= @amount) && (@status != "complete")
  return true
else
  return false
end
end

def execute_transaction
  if self.valid?
    @sender.deposit(@amount * -1)
    @receiver.deposit(@amount)
    @status = "complete"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    @sender.deposit(@amount)
    @receiver.deposit(@amount * -1)
    @status = "reversed"
  end
end




end
