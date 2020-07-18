class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @status == "pending" && @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end
