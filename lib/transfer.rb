require 'pry'

class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  @@all = [ ]
  
  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver 
    @status = status
    @amount = amount 
    @@all << self
  end
  
  def valid?
    if sender.valid? && receiver.valid? == true 
      true
    else 
      false
    end
  end
  
  def execute_transaction
    if valid? == true && status == 'pending' && sender.balance > amount
      receiver.deposit(amount)
      sender.withdraw(amount)
      @status = 'complete'
    else 
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    
    end 
  end
  
  def reverse_transfer
    if self.status == 'complete'
      sender.deposit(amount) 
      receiver.withdraw(amount)
      @status = 'reversed'
    end
  end
  
end
