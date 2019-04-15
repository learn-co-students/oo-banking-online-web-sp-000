require 'pry'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender,receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50 
  end 

  def valid?
    sender.valid? && receiver.valid?
  end 
   
end
