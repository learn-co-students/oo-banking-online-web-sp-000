class Transfer
  attr_accessor :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def status
    @status
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    d_amount = @amount
    if @sender.valid?
      @sender.balance -= d_amount
      @receiver.balance += d_amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
  end
  
  
end
