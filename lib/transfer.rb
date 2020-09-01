class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    self.class.all << self
  end
  
  def self.all
    @@all
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def completed?
    all_completed = self.class.all.select {|transfer| transfer.status == "complete"}
    all_completed.include?(self)
  end
  
  def execute_transaction
    if !self.valid? || self.sender.balance < self.amount
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif !self.completed?
      self.sender.withdraw(amount)
      self.receiver.deposit(amount)
      self.status = "complete"
    end
  end
  
  def reverse_transfer
    if self.completed?
      self.receiver.withdraw(amount)
      self.sender.deposit(amount)
      self.status = "reversed"
    end
  end
  
end
