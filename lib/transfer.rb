# Transfer
  # initialize
  #   can initialize a Transfer (FAILED - 1)
  #   initializes with a sender (FAILED - 2)
  #   initializes with a receiver (FAILED - 3)
  #   always initializes with a status of 'pending' (FAILED - 4)
  #   initializes with a transfer amount (FAILED - 5)
  # #valid?
  #   can check that both accounts are valid (FAILED - 6)
  #   calls on the sender and receiver's #valid? methods (FAILED - 7)
  # #execute_transaction
  #   can execute a successful transaction between two accounts (FAILED - 8)
  #   each transfer can only happen once (FAILED - 9)
  #   rejects a transfer if the sender does not have enough funds (does not have a valid account) (FAILED - 10)
  # #reverse_transfer
  #   can reverse a transfer between two accounts (FAILED - 11)
  #   it can only reverse executed transfers (FAILED - 12)

class Transfer
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end 
  
  
  def valid?
    #sender.balance >= amount && receiver.balance >= amount ? true : false 
    sender.valid? && receiver.valid? 
  end 
  
  def execute_transaction
    #binding.pry 
    if valid? && self.status == "pending" && sender.balance >= amount  
      sender.balance -= amount 
      receiver.balance += amount 
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if execute_transaction 
      receiver.balance -= amount 
      sender.balance += amount 
      self.status = "reversed"
    end 
  end 
  
end













