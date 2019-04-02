class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.sender.valid?(self.amount) && self.receiver.valid?(self.amount)
  end
  
  def execute_transaction
    self.status = "rejected" if !self.valid?
    transfer_money if self.status == "pending"
    self.status == "complete" ? !self.valid? : "Transaction rejected. Please check your account balance."
  end
  
  def transfer_money
      self.sender.deposit(-self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
  end
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(-self.amount)
      self.status = "reversed"
    end
  end
end
