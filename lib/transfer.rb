class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount 
  end
  
  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end
  
  def execute_transaction
  if valid? && @status == "pending"
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else
        reject
  end
  end

  def reject
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
    
  def reverse_transfer
  if @receiver.balance > @amount && @status == "complete"
    @receiver.withdraw(@amount)
    @sender.deposit(@amount)
    @status = "reversed"
  end
  end
end
