class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    #execute successful trans between 2 accounts
      #if the sender balance is greater than the amount
      #and the accounts valid? and self status = pending
      #sender value -=
      #receiver value +=
      #status = "complete"
    #else
      #status = "rejected"
      #"Transaction rejected. Please check your account balance."
    if sender.balance > amount && valid? && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #execute reverse trans between 2 accounts
      #if the sender balance is greater than the amount
      #and the accounts valid? and self status = complete
      #receiver value -=
      #sender value +=
      #status = "reversed"
    #else
      #status = "rejected"
      #"Transaction rejected. Please check your account balance."
      if sender.balance > amount && valid? && self.status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        self.status = "reversed"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end
end
