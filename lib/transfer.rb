class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end 

  def valid?
    @sender.valid? && @receiver.valid?
  end 

  def execute_transaction
    if !self.valid? || @sender.balance < @amount || @status == "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
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
