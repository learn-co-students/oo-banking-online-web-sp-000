class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  # sender and receiver will both be instances of BankAccount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance > amount
  end

  def execute_transaction
    if valid? && self.status == "pending"
      sender.withdrawl(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.withdrawl(amount)
      self.status = "reversed"
    end
  end
end
