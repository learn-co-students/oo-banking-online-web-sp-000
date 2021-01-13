class Transfer
  attr_accessor :sender,:receiver,:status,:balance,:amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction

    if (sender.balance >= amount) && @status == "pending" && sender.valid? && receiver.valid?
      sender.balance -= amount
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= amount
      sender.deposit(amount)
      @status = "reversed"
    end
  end

end
