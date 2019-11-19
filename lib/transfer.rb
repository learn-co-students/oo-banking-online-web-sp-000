class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @sender.transfers << self
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" && self.valid?
      if self.sender.balance >= amount
        self.sender.balance = self.sender.balance - self.amount
        self.receiver.balance = self.receiver.balance + self.amount
        self.status = "complete"
      else
        puts "Transaction rejected. Please check your account balance."
        self.status = "rejected"
      end
    else
      puts "Accounts invalid"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
      puts "Must execute transaction before reversing it."
    end
  end

end
