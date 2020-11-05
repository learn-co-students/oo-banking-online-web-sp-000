class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status, :bank_account
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    #chcking the sender's and receiver's bank account status
    if  self.sender.valid? == true &&  self.receiver.valid? == true
      return true
    else
      return false
    end
  end
  
  def execute_transaction
    if self.status == "pending" && self.valid? == true && self.sender.balance > self.amount
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status = "complete"
    elsif self.valid? == false || self.sender.balance < self.amount
      self.status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = "reversed"
    end
  end
  
  
end
