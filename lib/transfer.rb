class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    if self.valid? && self.status == 'pending' && self.sender.balance > amount 
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    elsif
      self.status = 'rejected' 
      "Transaction rejected. Please check your account balance."
    end 
  end
  
  def reverse_transfer
    if self.valid? && self.status == 'complete' && self.receiver.balance > amount
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end
  
end
