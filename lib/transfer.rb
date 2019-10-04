class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

    result = ""

    if (valid? && @status == "pending" && @sender.balance >= @amount)
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
      result = @status
    else
      @status = "rejected"
      result = "Transaction rejected. Please check your account balance."
    end
    result
  end

  def reverse_transfer
    if (@status == "complete")
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
    #result = @status

  end

end
