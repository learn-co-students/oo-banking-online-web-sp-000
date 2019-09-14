require 'pry'

class Transfer

  attr_accessor :status, :amount, :sender, :receiver
  #attr_reader :status, :amount, :sender, :receiver

  def initialize(sender="", receiver="", transfer)
    #@transfer = transfer
    @amount = transfer
    @sender = sender
    @receiver = receiver
    @status = 'pending'
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
