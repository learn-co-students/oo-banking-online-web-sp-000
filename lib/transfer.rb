class Transfer
  
  
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount, status = "pending")
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
    if valid? && status == "pending"
      if amount < self.sender.balance
        self.sender.balance -= amount
        self.receiver.balance += amount
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
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
  
  
  
  
  
end
