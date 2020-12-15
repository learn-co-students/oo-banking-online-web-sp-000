require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :transfer_amount, :bank_account
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def amount
    @amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending" && sender.balance >= @amount
      receiver.balance += @amount
      sender.balance -= @amount
      @status = "complete"
    elsif sender.balance < @amount || !self.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
