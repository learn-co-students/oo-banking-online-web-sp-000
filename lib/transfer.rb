class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amt)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amt
  end
  
  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount ? true : false
  end
  
  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @status == "pending" && !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
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
