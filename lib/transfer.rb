require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender 
    @receiver = receiver
    @status = status 
    @amount = amount
  end 
  
  def valid?
    if sender.valid? && receiver.valid?
      return true 
    end 
    false 
  end 
  
  def execute_transaction
    if self.status == "pending"
      if self.valid? == false || sender.balance < self.amount
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else 
        sender.deposit(-self.amount)
        receiver.deposit(self.amount)
        self.status = "complete"
      end 
    end 
  end 
  
  def reverse_transfer
    if self.status == "complete"
      sender.deposit(self.amount)
      receiver.deposit(-self.amount)
      self.status = "reversed"
    end 
  end 
  
end
