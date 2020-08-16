class Transfer
  # The Transfer class acts as a space for a transaction between two instances of the bank account class.
  # check the validity of the accounts before the transaction occurs

  attr_accessor :sender, :receiver, :amount, :last_transaction

  def initialize(sender, receiver, amount)
    # initializes with a sender 
    @sender = sender
    # initializes with a receiver 
    @receiver = receiver
    # always initializes with a status of 'pending' 
    @status = "pending"
    # initializes with a transfer amount
    @amount = amount
  end

  def execute_transaction
    # they can be executed and go to a "complete" state.
    # can execute a successful transaction between two accounts 
    # each transfer can only happen once 
    if valid? && @status != "complete" && @sender.balance > @amount && @sender.status != "closed"
      @sender.deposit(@amount * - 1)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif @status == "complete"
      return "Transaction was already completed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def status
    @status
  end

  def valid?
    # Checks that both accounts are valid
    sender.valid? && receiver.valid?
  end

  def reverse_transfer
     # Reverse a transfer between two accounts 
     # Can only reverse executed transfers 
     if @status == "complete"
        @sender.deposit(@amount)
        @receiver.deposit(@amount * - 1)
        @status = "reversed"
     end
  end
 end