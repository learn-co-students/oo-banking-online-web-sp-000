require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount, @status = sender, receiver, amount, "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.sender.balance > amount && self.status == "pending"
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
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
