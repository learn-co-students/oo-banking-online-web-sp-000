
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
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  # def execute_transaction
  #   if @sender.balance < @amount
  #     @status = "rejected"
  #     return "Transaction rejected. Please check your account balance."
  #   elsif @status == "pending" && valid?
  #   binding.pry
  #     @sender.balance -= @amount
  #     @receiver.balance += @amount
  #     @status = "complete"
  #   end
  # end
  def execute_transaction
    if @status == "pending" && valid? && @sender.balance > @amount
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    #binding.pry
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit( @amount*-1)
      @status = "reversed"
    end
  end
end
