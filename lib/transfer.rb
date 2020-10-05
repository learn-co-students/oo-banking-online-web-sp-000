class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if @sender.balance < @amount || !valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
