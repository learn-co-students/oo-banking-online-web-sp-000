require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def status
    @status
  end

  def amount
    @amount
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if valid? && @status != 'complete' && sender.balance >= amount
      receiver.deposit(amount)
      sender.deposit(-amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      receiver.deposit(-amount)
      sender.deposit(amount)
      @status = 'reversed'
    end
  end

end
