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
    if @status == "pending" && (@sender.balance - @amount) >= 0 && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.swap_persons
      @status = "pending"
      self.execute_transaction
      self.swap_persons
      @status = "reversed"
    end
  end

  def swap_persons
    @sender,@receiver = @receiver,@sender
  end

end
