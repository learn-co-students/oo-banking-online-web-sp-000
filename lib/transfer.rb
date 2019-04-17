class Transfer
  attr_accessor :status
  attr_reader :receiver, :sender, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? == true
      sender.balance -= @amount
      receiver.balance += @amount
      @amount = 0
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end
end
