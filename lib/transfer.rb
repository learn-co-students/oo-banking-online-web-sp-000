class Transfer
   
attr_accessor :transfer, :sender, :receiver, :money

  def initialize(sender, receiver, money)
    @transfer = "pending"
    @sender = sender
    @receiver = receiver
    @money = money
  end
  
  def status 
    return @transfer
  end
  
  def amount
    return @money 
  end
  
  def valid?
    return @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if status != "complete"
      if @sender.balance >= @money && @sender.valid? && @receiver.valid?
        @receiver.balance += @money
        @sender.balance -= @money
        @transfer = "complete"
      else 
        @transfer = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if status == "complete"
      @receiver.balance -= @money
      @sender.balance += @money
      @transfer = "reversed"
    end
  end
  
end
