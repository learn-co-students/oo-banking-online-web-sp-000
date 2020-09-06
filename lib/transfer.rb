require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount) 
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"

  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @status != "complete" 
      # binding.pry
      withdrawl_complete = @sender.withdrawl(@amount)
      if withdrawl_complete && self.valid?
        #  binding.pry
        @receiver.deposit(@amount)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    # binding.pry
    if @status == "complete"
      @status = "pending"
      temp_receiver = @sender
      temp_sender =  @receiver
      @sender = temp_sender
      @receiver = temp_receiver
      self.execute_transaction
      if @status == "complete"
        @status = "reversed"
      end
    end

  end

end