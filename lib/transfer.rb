require 'pry'
class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  def initialize (sender, receiver, amount = 0)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    @sender.valid? && @sender.balance > @amount && @receiver.valid? ? true : false
  end
  def sender_balance
    @sender.display_balance
  end
  def execute_transaction
    #binding.pry
    while @status == "pending" do
      if !self.valid?
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
    end
  end
  def reverse_transfer
    #binding.pry
    while @status == "complete" do
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
    end
  end
end
