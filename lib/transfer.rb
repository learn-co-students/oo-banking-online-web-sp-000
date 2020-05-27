#has a sender, receiver, amount, status
#belongs to bank accounts
#checks for validity of account, checks for funds
#transfers start out in a pending status, and either goes to complete or reject based on above checks
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
    # if sender is valid and the receiver is valid return true
  end

  def execute_transaction
    # both accounts must be open, sender must have enough funds to send, and the status has to be pending
    if @sender.valid? && @receiver.valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end

