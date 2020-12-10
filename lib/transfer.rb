require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

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
    if sender.balance < amount || !valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status != "complete" && sender.valid?
      self.receiver.balance = self.receiver.balance + amount
      self.sender.balance = self.sender.balance - amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if valid? && self.receiver.balance > amount && status == "complete"
      receiver.withdraw(amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
  end

end
