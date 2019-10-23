class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  //comment 
  def valid? 
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction 
    if self.valid? == false || sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if (@status == "pending")
     sender.deposit((-1)*@amount)
     receiver.deposit(@amount)
     @status = "complete"
    end
  end
  
  def reverse_transfer 
    if status == "complete"
      @status = "pending"
      temp = @sender 
      @sender = @receiver 
      @receiver = temp
      self.execute_transaction
      @status = "reversed"
    end
  end
end
