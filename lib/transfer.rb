require 'pry'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount, :id
  @@transactions = []
  
  def initialize(sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
    @id = Time.now 
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    #binding.pry
    if self.sender.balance > self.amount && self.valid? && self.status == 'pending'
      self.sender.balance -= self.amount
      self.receiver.deposit(self.amount)
      self.status = 'complete'
      @@transactions << self
    else
      self.status = 'rejected'
      @@transactions << self
      "Transaction rejected. Please check your account balance."
    end
  end
    
  def reverse_transfer
    #binding.pry
    trans = @@transactions.detect {|transaction| transaction.id == self.id}
    if trans && trans.status == 'complete'
      trans.sender.balance += trans.amount
      trans.receiver.balance -= trans.amount
      trans.status = 'reversed'
    end
  end
  
end
