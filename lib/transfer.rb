require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :amount
  attr_reader :status 
  def initialize(sender, receiver, status)
    @sender = sender 
    @receiver = receiver
    @status = 'pending'
    @amount = 50
  end   

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @receiver.valid? && @sender.balance >= @amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance." 
    end 
  end 

  # def reverse_transfer
  #   # transfer.execute_transaction
  #   if @sender.valid? && @receiver.valid? && @sender.balance > @amount && self.status == "pending"
  #     @sender.balance += @amount
  #     @receiver.balance -= amount
  #     @status = 'reversed'
  #   end 
  # end 

end
