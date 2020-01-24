require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid?
    if @sender.status == BankAccount.new(@sender).status && @receiver.status == BankAccount.new(@receiver).status
      true 
    else
      false
    end 
  end 
end
