class Transfer
  
  attr_accessor :transfer, :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if self.receiver.valid? && self.sender.valid?
      true 
    else 
      false 
    end
  end
  
  def execute_transaction
    if sender.status = "open" && receiver.status == "open" && amount < sender.balance && self.status != "complete"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else receiver.status == "closed" || amount > sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if sender.status = "open" && receiver.status == "open" && amount < receiver.balance && self.status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    end
  end
  
end
