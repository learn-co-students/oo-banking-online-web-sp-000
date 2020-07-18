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
!!(@sender.valid? == true && @receiver.valid? == true)
end

def execute_transaction
if !!(@amount <= @sender.balance && self.valid? && self.status != "complete" ) == true
  @sender.balance -= @amount
  @receiver.balance += @amount
  self.status = "complete"
else
  self.status = "rejected"
  return "Transaction rejected. Please check your account balance."
end
end

def reverse_transfer
if self.status == "complete"
  @sender.balance += @amount
  @receiver.balance -= @amount
  self.status = "reversed"
end
end

end
