class Transfer 
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    @sender.valid? && @receiver.valid? == true 
  end 
  
  def execute_transaction 
    if valid? && @sender.balance > amount && self.status == "pending"
      @sender.deposit(self.amount * -1)
      @receiver.deposit(self.amount)
      self.status = "complete"
    else 
      self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
  
  def reverse_transfer 
    if valid? && receiver.balance > amount && self.status == "complete"
      @receiver.deposit(self.amount * -1)
      @sender.deposit(self.amount)
      self.status = "reversed"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  
  
end
