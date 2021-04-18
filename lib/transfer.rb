class Transfer
attr_accessor :sender, :receiver, :amount, :status, :balance
#attr_reader :status
  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
  #  status = "pending"
    @status = status
    @amount = amount
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end

def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
    sender.withdrawal(self.amount)
    receiver.deposit(self.amount)
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance"
    end
  end
    #   if  @status == "complete"
    #   @sender.balance += amount
    #   @receiver.balance -= amount
    #   @status == "reversed"
    #   else
    #   @status == "rejected"
    # end
 end
