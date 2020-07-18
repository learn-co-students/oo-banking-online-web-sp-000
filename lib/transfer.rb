require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end
  
  def execute_transaction
    if status == "pending"
      sender.deposit(-amount)
      if valid?
        receiver.deposit(amount)
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if status == "complete"
      receiver.deposit(-amount)
      if valid?
        sender.deposit(amount)
        self.status = "reversed"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
end