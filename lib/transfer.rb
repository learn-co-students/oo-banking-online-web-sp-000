class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    return nil if @status != "pending"
    if @sender.balance - @amount >= 0 && self.valid? 
      @sender.balance -= amount
      @receiver.deposit(amount)
      @status = "complete"
    else
<<<<<<< HEAD
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
=======
      @status = "Failed"
      "Transaction rejected. Please check your account balance."
    end
      
>>>>>>> 88675cf1d0935d3a7f26ed3ac12e20551a61af12
  end
  
  def reverse_transfer
    if @status != "completed"
      @sender, @receiver = @receiver, @sender
      @status = "pending"
      self.execute_transaction
      @status = "reversed"
    end
  end

end
