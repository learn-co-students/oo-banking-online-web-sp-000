require 'pry'
class Transfer
attr_reader :sender, :receiver, :amount
attr_accessor :status

  def initialize (sender, receiver, amount)
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

  def execute_transaction
    #binding.pry
    if @status != "complete"
      if valid? && amount <= sender.balance
        @sender.withdrawel(amount)
        @receiver.deposit(amount)
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.withdrawel(amount)
      @status = "reversed"
    end
  end

end
