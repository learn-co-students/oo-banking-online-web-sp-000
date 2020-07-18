class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  
  def initialize(sender, receiver, transfer_amount)
   @sender = sender
   @receiver = receiver
   @status = 'pending'
   @amount = transfer_amount
  end
  
  def valid?
      sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction
    if sender.balance >= @amount && self.status != 'complete'
      receiver.balance = receiver.balance + @amount
      sender.balance = sender.balance - @amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == 'complete'
      sender.balance = sender.balance + @amount
      receiver.balance = receiver.balance - @amount
      self.status = 'reversed'
    else
      "Can't reverse"
    end
  end
  
end
