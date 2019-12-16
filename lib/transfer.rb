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
  attr_accessor :sender, :receiver, :transfer_amount
  attr_reader :status 
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender 
    @receiver = receiver 
    @transfer_amount = transfer_amount
    @status = "pending"
  end 
  
  def amount 
    @transfer_amount = 50 
  end 
  
  def valid?
    sender.balance > 0 && receiver.balance > 0 ? true : false 
    sender.valid?
    receiver.valid? 
  end 
  
  def execute_transaction
  end 
  
end













