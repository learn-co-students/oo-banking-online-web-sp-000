require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if self.valid? && sender.balance >= amount && @status == "pending"
      sender.deposit(-amount) && receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount) && receiver.deposit(-amount)
      @status = "reversed"
    end
  end

end
