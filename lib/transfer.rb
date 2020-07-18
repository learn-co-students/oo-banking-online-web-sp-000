require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :amount
  @@all = []
  
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
    if @sender.valid? && @receiver.valid? && @sender.balance >= @amount 
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction 
    if !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      if !@@all.include?(self)
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
      @@all << self 
    end 
    end 
  end 
  
  def reverse_transfer
    if @status == "complete" 
      previous_amount = @@all.last.amount 
      @sender.balance += previous_amount
      @receiver.balance -= previous_amount
      @status = "reversed"
      @@all << self 
  end 
  end 
  
end
