require 'pry'
require_relative './bank_account.rb'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
#      Failure/Error: let(:transfer) { Transfer.new(amanda, avi, 50) }
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid? && @status != "complete" && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @status == "complete" && @receiver.balance >= @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end

# a space for a transaction between two instances of the bank account class. 
# you can't just transfer money to another account without the bank running checks first. 

#reject a transfer IF
# accounts are invalid
# sender does not have money

# pending >
#     complete > reversed
#     rejected