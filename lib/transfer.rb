class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  @@executed_transactions = []

  def self.executed_transactions
    @@executed_transactions
  end

  def initialize(sender, receiver, amount = 50)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end

  def valid?
    self.receiver.valid? && self.sender.valid? ? true : false
  end

  def execute_transaction
    if !@@executed_transactions.include?(self) && self.valid? && self.sender.balance >= self.amount
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
      @@executed_transactions << self
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@executed_transactions.include?(self)
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
      @@executed_transactions.delete(self)
    end
  end

end
