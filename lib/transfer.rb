class Transfer
  # your code here
attr_reader :sender, :receiver, :amount
attr_accessor :status
@@transaction=[]

def transaction
  @@transaction
end

def transaction=(transaction)
   @@transaction=transaction
end

def initialize(sender,receiver,transfer_amount)
  @sender=sender
  @receiver=receiver
  @status="pending"
  @amount=transfer_amount
end

def valid?

 @sender.valid? && @receiver.valid? && @amount<@sender.balance
end

def execute_transaction
 if self.transaction.include?(self)
 elsif self.valid?
   @sender.balance-=@amount
   @receiver.balance+=@amount
   @status="complete"
   self.transaction<<self
 elsif @sender.balance<@amount
   @status="rejected"
    "Transaction rejected. Please check your account balance."
  else @status="rejected"
 end
end

def reverse_transfer
  if self.transaction.include?(self)
  @sender.balance+=@amount
  @receiver.balance-=@amount
  self.transaction-=[self]
  @status="reversed"
end
end

end
