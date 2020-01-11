class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  # can check that both accounts are valid
  # calls on the sender and receiver's #valid? methods
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  # can execute a successful transaction between two accounts
  # each transfer can only happen once
  # rejects a transfer if the sender does not have enough funds (does not have a valid account)
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
