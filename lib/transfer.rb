require 'pry'

class Transfer

  attr_reader  :sender, :receiver, :amount
  attr_accessor :status  

  # @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = 'pending'
    @amount = amount
    # @@all << self 
  end   

  def valid?
    if sender.valid? && receiver.valid?
      true
     else 
      false
     end 
  end  

  def execute_transaction 
    if valid? && @status == 'pending' && sender.balance > amount 
      receiver.deposit(amount) 
      sender.balance = sender.balance - amount
      @status = "complete"  
    else   
      @status = 'rejected'
      "Transaction rejected. Please check your account balance." 
    end  
  end  

  def reverse_transfer 
    if @status == "complete" 
      receiver.balance = receiver.balance - amount 
      sender.balance = sender.balance + amount 
      @status = 'reversed'
    else  
    end 
  end   
end
