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
    if @sender.valid? == true
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
      amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    @receiver.balance -= amount
    @sender.balance += amount
    @status = "reversed"
  end
  
  
end
