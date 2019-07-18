class Transfer
  attr_accessor :status, :transfers
  attr_reader :sender, :receiver, :amount
  @@transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@transfers << self
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      if @sender.balance >= @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end

end
