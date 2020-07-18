class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @execute_transaction = false
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    return nil if @status != "pending"
    if @sender.balance - @amount >= 0 && self.valid? 
      @sender.balance -= amount
      @receiver.deposit(amount)
      @execute_transaction = true
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @execute_transaction == true
      @sender, @receiver = @receiver, @sender
      @status = "pending"
      self.execute_transaction
      @status = "reversed"
    end
  end

end
