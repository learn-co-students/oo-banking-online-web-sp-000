require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    #binding.pry
    if @status == "complete"
      return "Duplicate transaction rejected."
    elsif
      self.valid? == false || sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else @status == "pending"
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance = sender.balance + @amount
      receiver.balance = receiver.balance - @amount
      @status = "reversed"
    end
  end
end
