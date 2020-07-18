class Transfer
  attr_accessor :status, :amount, :last_transfer_amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance >= @amount ? true : false
  end

  def execute_transaction
    if self.valid?
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = 'complete'
      self.last_transfer_amount = amount
      self.amount = 0
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += last_transfer_amount
      self.receiver.balance -= last_transfer_amount
      self.status = 'reversed'
    end
  end
end
