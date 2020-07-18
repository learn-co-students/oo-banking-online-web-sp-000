require "pry"
class Transfer

attr_accessor :sender, :receiver, :amount, :status

def initialize(sender, receiver, amount)
@sender = sender
@receiver = receiver
@amount = amount
@status = "pending"
end

def valid?
 @sender.valid? && @receiver.valid?
 
end

def execute_transaction
 if (@status == "pending") && self.valid? && sender.balance >= amount
  @receiver.deposit(amount)
  @sender.balance -= amount
  @status = "complete"
else
  @status = "rejected"
  "Transaction rejected. Please check your account balance."
 end 
 
end

def reverse_transfer
  if @status == "complete"
   @receiver.balance -= amount
   @sender.deposit(amount)
  @status = "reversed"
end
end



#binding pry  

end

