class Transfer
  # your code here
  attr_accessor :amount, :sender, :receiver, :status, :count
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    # check that both accounts are valid
    # calls on the sender and receiver's #valid? methods
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  def execute_transaction
    # can execute a successful transaction between two accounts
    # each transfer can only happen once
    # rejects a transfer if the sender doesn't have a valid account
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit( @amount * -1 )
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end
  def reverse_transfer
    # can reverse a transfer between two accounts
    # can only reverse executed transfers
    if @status == "complete"
      @sender.deposit( @amount )
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
end
