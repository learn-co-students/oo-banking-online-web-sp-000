class Transfer
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  end

def valid?
if sender.valid? == true && receiver.valid? == true
  true
else
  false
end
end

def execute_transaction
  if self.sender.valid? && self.receiver.valid? && self.sender.balance > amount && self.status == "pending"
    self.sender.balance -= amount
    self.receiver.balance += amount
    self.status = "complete"

  else
     self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end


def reverse_transfer
if self.status == "complete"
self.receiver.balance -= amount
self.sender.balance += amount
self.status = "reversed"
end
end







end
