class Transfer
  attr_accessor :amount, :sender, :receiver, :status
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    else
      return false 
    end
  end
  
  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete" 
      @sender.deposit(amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
