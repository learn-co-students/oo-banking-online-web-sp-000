class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status ="pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false 
  end
  

  
  def execute_transaction
    # binding.pry
    if @sender.balance < @amount || !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

  
end
