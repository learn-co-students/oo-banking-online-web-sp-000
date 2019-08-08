require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end

  def valid?
    @sender.valid? && @sender.balance > @amount && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end


end
