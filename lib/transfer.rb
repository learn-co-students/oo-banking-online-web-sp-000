class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    if (@sender.valid? == true && @receiver.valid? == true)
      if (@sender.balance >= @amount)
        return true
      else
        return false
      end
    else
      return false
    end
  end
  def execute_transaction
    if (self.valid? == true && @status == "pending")
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if (self.valid? == true && status == "complete")
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end
end
