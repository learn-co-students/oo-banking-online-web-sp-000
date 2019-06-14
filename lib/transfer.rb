require 'pry'

class Transfer
  # your code here
  
  attr_accessor :status
  attr_reader :amount, :receiver, :sender
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid? && self.sender.balance > self.amount
      true
    else
      false
    end
  end
  
  def execute_transaction
    if !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.valid? && self.status == "pending"
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end
  
end
