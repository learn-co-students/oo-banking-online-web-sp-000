require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender, receiver, status = "pending", transfer_amount)
    @sender = sender 
    @receiver = receiver 
    @status = status
    @amount = transfer_amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    else 
      return false 
    end
  end 

  def execute_transaction
    if valid?
      if @sender.balance > @amount && @status == "pending" 
        @sender.balance -= @amount 
        @receiver.balance += @amount
        @status = "complete"
          else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      @status = "reversed"
    end
  end 

end
