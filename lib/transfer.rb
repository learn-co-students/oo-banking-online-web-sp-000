class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  # initialize transfer with sender, receiver, amount
  # sets status to "pending"
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  # verifies sender and receiver have valid BankAccount's
  def valid?
    sender.valid? && receiver.valid?
  end

  # if sender/receiver are valid AND sender balance > transfer amount AND status "pending"
  # => then
  # ==> remove amount from sender account / add to receiver account / change status "complete"
  # => else
  # ==> reject the transfer
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  # if sender/receiver are valid AND receiver balance > transfer amount AND status "complete"
  # => then
  # ==> remover amount from receiver account / add to sender account / change status "reversed"
  # => else
  # ==> reject the transfer
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  # sets transfer status to "rejected"
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
