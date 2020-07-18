class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  
def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount 
  @status = "pending"
end 

def valid?
  value = ""
  @sender.balance -= amount
  (@sender.valid? && @receiver.valid?)? value = true : value = false 
  @sender.balance += amount
  value
end 

def reverse_transfer
  if @status == "complete" && valid?
    @sender.balance += @amount 
    @receiver.balance -= @amount
    @status = "reversed"
  else   
    end 
end 

def execute_transaction 
  if valid? == true && @status == "pending"
    @sender.balance -= @amount 
    @receiver.balance += @amount 
    @status = "complete"
  else 
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end 

end
