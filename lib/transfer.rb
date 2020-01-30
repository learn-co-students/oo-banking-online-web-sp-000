class Transfer
attr_reader :sender, :receiver, :amount
attr_accessor :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    #if sender account is valid and balance is > amount and status is pending
    if sender.valid? && sender.balance > amount && status == "pending" && receiver.valid?
    #if reciever account is valid
    # transfer amount
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    # transfer change status to complete
    #otherwise state check account balance
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    end
  end
end
