class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    if @sender.valid? && @receiver.valid?  
      true
    end
  end
  def execute_transaction 
   if @sender.valid? == true && @sender.balance >=@amount && @status == "pending"
   @sender.balance = @sender.payment(amount)
    @receiver.balance = @receiver.deposit (amount)
    @status = "complete"

   else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction
      @sender.balance = @sender.deposit(amount)
      @receiver.balance = @receiver.payment(amount)
      @status = "reversed"
    end
  end
end
