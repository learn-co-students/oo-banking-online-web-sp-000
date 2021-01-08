class Transfer
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    accounts_valid = @sender.valid? && @receiver.valid? ? true : false
    sufficient_funds = @sender.balance > @amount ? true : false
    accounts_valid && sufficient_funds ? true :false
  end
  
  def execute_transaction
    not_rejected =  self.status == "pending" ? true : false
    
    if valid?  && not_rejected
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
   end
   
  end
  
  def reverse_transfer 
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
  
end
