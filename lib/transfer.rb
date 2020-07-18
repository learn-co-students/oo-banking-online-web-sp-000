class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid? # can check that both accounts are valid
    sender.valid? && receiver.valid? ? true:false
  end

  def valid_transfer?
    if self.status != "complete" && self.valid? && sender.balance > self.amount
      true 
    else
      false
    end
  end

  def execute_transaction
    if valid_transfer?
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = "complete" 
    else
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed" 
    end
  end

end
