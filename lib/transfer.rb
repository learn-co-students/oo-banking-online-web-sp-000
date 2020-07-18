class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid? && @amount < @sender.balance
      true 
    else 
      false 
    end
  end
  
  def execute_transaction
      if valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
       define_singleton_method(:execute_transaction) {}
     elsif @amount > @sender.balance
     @status = "rejected"
  "Transaction rejected. Please check your account balance."
     end
  end
     
  
  def reverse_transfer
    if @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
    end
  end
  
    
    
end
