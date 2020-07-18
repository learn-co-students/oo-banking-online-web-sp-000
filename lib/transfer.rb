class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sending_account, receiver_account, transfer_amount)
    @sender = sending_account
    @receiver = receiver_account
    @amount = transfer_amount
    @status = "pending"
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?  
  end
  
  def execute_transaction
    #Check to make sure that the transaction is pending first.  Next check that both
    #accounts have funds then execute then either complete or reject the trasnfer changing
    #the status to match
    if self.status == "pending"
      if self.sender.balance >= self.amount && self.receiver.balance >= self.amount
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    #If the status is complete then add the amount back to the sender and subtract it from 
    #the sender
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
