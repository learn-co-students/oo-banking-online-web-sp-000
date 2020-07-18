class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    return true if @sender.valid? && @receiver.valid? && @sender.balance - @amount > 0
    false
  end
  
  def execute_transaction
    return nil if @status == "complete"
    if !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    @sender.withdraw(@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  end
  
  def reverse_transfer
    if !valid? || @status != "complete"
      return "Transaction rejected. Please check your account balance."
    end
    
    @receiver.withdraw(@amount)
    @sender.deposit(@amount)
    @status = "reversed"
  end
end
