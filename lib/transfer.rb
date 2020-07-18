require_relative './bank_account.rb'

class Transfer
  #create a class that transfers between two bank account objects
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  #checks both sender/receiver accounts are open
  def valid?
    @sender.valid? && @receiver.valid?
  end
  #executes the transaction - check sender  has enough money and both accounts are open
  def execute_transaction
    if @sender.balance < @amount || (!self.valid?)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = "complete"
    end
  end
#reverse a completed transaction
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = "reversed"
    end
  end
end
