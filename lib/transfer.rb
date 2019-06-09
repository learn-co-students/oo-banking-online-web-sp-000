class Transfer
 attr_accessor :status
 attr_reader :sender, :receiver, :amount
 
  def initialize(sender, receiver, amt)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amt
  end 
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    self.sender.deposit(-(self.amount)) if self.valid? && self.status == "pending"
    self.receiver.deposit(self.amount) if self.valid? && self.status == "pending"
    self.valid? && self.status == "pending" ? self.status = "complete" : self.status = "rejected"
    "Transaction rejected. Please check your account balance." unless self.status == "complete"
  end 
  
  def reverse_transfer
    self.sender.deposit(self.amount) if self.status == "complete"
    self.receiver.deposit(-(self.amount)) if self.status == "complete"
    self.status = "reversed"
  end 
    
end
