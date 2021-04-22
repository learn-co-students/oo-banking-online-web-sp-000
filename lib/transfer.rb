require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance > amount
  end

  def execute_transaction
    # binding.pry
    if valid? && @status == 'pending'
      sender.deposit(-amount)
      receiver.deposit(amount)
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
