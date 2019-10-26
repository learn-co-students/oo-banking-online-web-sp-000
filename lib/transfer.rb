require "pry"
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @status == "pending" && self.sender.balance > amount && valid?
        self.sender.balance = self.sender.balance - amount
        self.receiver.balance = self.receiver.balance + amount
        @status = "complete"

    else
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction == "complete"
      self.sender.balance = self.sender.balance + (amount)
      self.receiver.balance = self.receiver.balance - (amount)
      @status = "reversed"
    end
  end
end
