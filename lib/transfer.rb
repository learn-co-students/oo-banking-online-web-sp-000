class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount, :last_transfer
  
  
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    @last_transfer = 0
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false 
  end
  
  def execute_transaction
    if !(self.valid? && @sender.balance >= @amount)
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.valid? && @sender.balance >= @amount && @status != 'complete'
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "complete"
      return "Transaction was already executed"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end
  
end
