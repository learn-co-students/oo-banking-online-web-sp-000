class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@all = []

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver 
    @status = status 
    @amount = amount 
    @@all << self 
  end 

  def self.all
    @@all 
  end 

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end
  end 

  def execute_transaction
    if valid? && sender.balance > self.amount && status == "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount 
      self.status = "complete"
    else
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if valid? && sender.balance > self.amount && status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount 
      self.status = "reversed"
    else
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end 
  end 

end
