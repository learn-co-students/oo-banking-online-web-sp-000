require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @sender.balance > @amount && valid? && status != 'complete'
      @receiver.deposit(@amount)
      @sender.deposit(@amount*-1)
      @status = "complete"
    elsif @status == 'complete'
      return "Transaction was already executed"
    else
      @receiver.deposit(@amount)
      @sender.deposit(@amount*-1)
      @status = "complete"
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status =="complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount*-1)
      @status = 'reversed'
    end
  end

end
