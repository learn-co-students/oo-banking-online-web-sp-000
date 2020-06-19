class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def self.all
    @@all
  end
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  def execute_transaction
    if self.valid? && self.sender.balance >= self.amount
      if !(self.class.all.include?(self))
        self.sender.withdraw(amount)
        self.receiver.deposit(amount)
        self.status = "complete"
        @@all << self
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.class.all.include?(self)
      self.receiver.withdraw(amount)
      self.sender.deposit(amount)
      self.status = "reversed"
    end
  end
end
