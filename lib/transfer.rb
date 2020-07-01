class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if sender.valid? == false || receiver.valid? == false
      false
    else
      true 
    end
  end
  
  def execute_transaction
    if @sender.valid? == true && @receiver.valid? == true &&  @status != "complete" && @amount <= @sender.balance
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    elsif @amount >= @sender.balance || @sender.valid? == false || @receiver.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
  
      
  
    
  
  
end
