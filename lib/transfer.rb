require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid?
    @sender.valid? && receiver.valid? ? true : false
  end 

  def execute_transaction
    @receiver.balance += amount
    @sender.balance -= amount
    self.status = "complete"
    
    # What does it mean that a transher can only happen once?
  end
end
