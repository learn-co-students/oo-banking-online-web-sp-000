require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if valid? and sender.balance > @amount and self.status != "complete"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      rejection_message
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    else
      rejection_message
    end
  end

  def rejection_message
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
