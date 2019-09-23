class Transfer
  
  attr_accessor :receiver, :sender, :status, :amount
  
  def initialize(sender_oi, receiver_oi, transfer_amount)
    @receiver = receiver_oi
    @sender = sender_oi
    @status = "pending"
    @amount = transfer_amount
  end
  
  def valid?
    self.receiver.valid? && self.sender.valid? && self.sender.balance > self.amount && (self.status == "pending" || self.status == "rejected")
  end
  
  def execute_transaction
    if self.valid? 
      self.receiver.balance = self.receiver.balance + self.amount
      self.sender.balance = self.sender.balance - self.amount
      self.status = "complete"
    else 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
    
  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance = self.receiver.balance - self.amount
      self.sender.balance = self.sender.balance + self.amount
      self.status = "reversed"
    end
  end
end

#  rspec spec/transfer_spec.rb