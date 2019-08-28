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
    if self.valid?
      if self.status != "complete"
        sender.balance -= @amount
        receiver.balance += @amount
        self.status = "complete"
      end
    elsif sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
  end

end
