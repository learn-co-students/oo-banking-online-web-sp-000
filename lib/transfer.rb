require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver 

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.amount < @sender.balance && @status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance  = @receiver.balance - @amount
      self.status = "reversed"
    else
      self.status = "rejected"
    end
    #binding.pry
  end

end
