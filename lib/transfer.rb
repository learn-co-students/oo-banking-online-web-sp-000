require 'pry'
class Transfer
  attr_accessor :amount, :status, :accounts
  attr_reader :sender, :receiver

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
    @sender.valid? && @receiver.valid?
end

def execute_transaction
  while @status == "pending"
   if !@sender.valid?
     @status = "rejected"
     puts "Transaction rejected. Please check your account balance."
   else
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
   end
 end
end
binding.pry
end
