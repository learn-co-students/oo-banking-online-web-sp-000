class Transfer
 
 attr_accessor :sender, :receiver, :status, :amount
 
 def initialize(sender, receiver, amount, status="pending")
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = status
 end
 
 def valid?
  if sender.valid? && receiver.valid?
    true 
  else 
    false 
  end
 end
 
 def execute_transaction
  if valid? && sender.balance > @amount && @status == "pending"
    sender.withdrawl(@amount)
    receiver.deposit(@amount)
    @status = "complete"
  else 
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
 end
 
 def reverse_transfer
   if valid? && receiver.balance > @amount && @status == "complete"
     receiver.withdrawl(@amount)
     sender.deposit(@amount)
     @status = "reversed" 
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
 end
 
end
