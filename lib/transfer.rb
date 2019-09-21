class Transfer
  
  attr_accessor :status, :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end
  
  def valid?()
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction()
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      p "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer()
    
  end
  
end
