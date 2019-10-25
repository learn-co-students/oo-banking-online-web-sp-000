require "pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @status != "complete" && self.sender.balance >= (self.sender.balance - amount)
        self.sender.balance = self.sender.balance - amount
        self.receiver.balance = self.receiver.balance + amount
        @status = "complete"
    else self.sender.valid? = false || self.receiver.valid? = false
      "Transaction rejected. Please check your account balance."

    end
  end
end
