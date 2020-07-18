require 'pry'
class Transfer
  attr_reader :status
  attr_accessor :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
      @executed = 0
  end
  def valid?
      @sender.valid? && @receiver.valid? ? true : false
  end
  def execute_transaction
      if @sender.balance > @amount && @sender.valid? && @status = "pending" && @executed == 0
         @sender.balance -= @amount
         @receiver.deposit(@amount)
         @executed += 1
         @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
  end
  def reverse_transfer
   #binding.pry
      if @status == "complete" && @receiver.status == "open"
         @receiver.withdrwal(@amount)
         @sender.deposit(@amount)
         @status = "reversed"
      end
  end
  def status
      @status
  end
end
