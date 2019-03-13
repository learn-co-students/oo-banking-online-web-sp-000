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
    if sender.valid? && receiver.valid?
      true
    else
      nil
    end
  end
  
  def execute_transaction 
    if self.valid? && self.status == "pending"
      if amount < sender.balance
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
      else
         self.status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
    else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
