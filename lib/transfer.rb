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
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance < @amount || !valid? || @status != "pending"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if receiver.balance < @amount || !valid? || @status != "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
