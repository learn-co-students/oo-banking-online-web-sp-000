require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver,amount)
  @sender=sender
  @receiver=receiver
  @status="pending"
  @amount=amount
end

def valid?
  self.receiver.valid? && self.sender.valid?
end

def execute_transaction
  if sender.balance>amount && self.receiver.valid? && self.sender.valid? && self.status=="pending"
    sender.balance=sender.balance-amount
    receiver.balance=receiver.balance+amount
    self.status="complete"
  else
    self.status="rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status=="complete"
    sender.balance=sender.balance+amount
    receiver.balance=receiver.balance-amount
    @status="reversed"
  end
end

end
