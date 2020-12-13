require 'pry'
class Transfer
  # your code here

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
        true
    else
      false
    end
  end

  def execute_transaction
    if valid? && status != "complete" && sender.balance > amount
        sender.balance -= amount 
        receiver.balance += amount
        self.status = "complete" 
    else  
      rejected_transfer
    end
  end

  def rejected_transfer
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  def reverse_transfer
    if valid? && self.status == "complete"
        sender.balance += amount 
        receiver.balance -= amount
        self.status = "reversed"
    else
        rejected_transfer
    end
  end


end
