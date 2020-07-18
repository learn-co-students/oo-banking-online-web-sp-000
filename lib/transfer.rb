
class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bankaccount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.bankaccount = BankAccount.new(bankaccount)
    self.bankaccount.valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    self.sender.balance = self.sender.balance - self.amount
    self.receiver.balance = self.receiver.balance + self.amount
    define_singleton_method(:execute_transaction) {}

    if self.sender.valid?
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance = self.sender.balance + self.amount
      self.receiver.balance = self.receiver.balance - self.amount
      self.status = "reversed"
    end
  end

end
