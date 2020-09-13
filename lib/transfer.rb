class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid? && sender.balance >= self.amount
      true
    else
      false
    end
  end

  def execute_transaction

    if self.status == "pending" && self.valid?
      sender.balance -= self.amount
      receiver.balance += self.amount
      @status = "complete"
    elsif self.status == "complete"
      "This transfer has already been completed."
    elsif self.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      "Wowee something went wrong"
    end
      
  end

  def reverse_transfer

    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      @status = "reversed"
    else
      "Transfer could not be reversed."
    end
    
  end

end
