require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  @@all = []
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? == true && @receiver.valid? == true && @sender.balance > @amount
  end
    
  def execute_transaction 
    if @status == "complete"
      "This action is not allowed"
    else
      if valid? 
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
      @@all << self 
      else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      end
      
    end
  
  end
  
  def reverse_transfer
    
    if @status == "complete"
    
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
    
  else
    "Can't reverse unsuccessful transactions"
  end
    
    
  end
    





end
