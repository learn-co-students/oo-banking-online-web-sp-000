class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true 
      true
    else
      false
    end
  end
  
  def execute_transaction
    if valid? == true && @amount < @sender.balance && @status == "pending"
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
    elsif @amount > @sender.balance
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @sender.status == "closed" || @receiver.status == "closed"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end    
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
