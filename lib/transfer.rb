class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && @status == "pending" && sender.balance > @amount
      sender.old_balance = sender.balance
      receiver.old_balance = receiver.balance
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.old_balance
      receiver.balance = receiver.old_balance
      @status = "reversed"
    else
      return "invalid"
    end
  end


end
