class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
   def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end
  
    def valid? 
      return true if sender.valid? && receiver.valid? 
      return false 
    end 
  
    def execute_transaction
      if @sender.balance > @amount && @status == "pending"
        @sender.deposit(-(@amount))
        @receiver.deposit(@amount)
        @status = "complete"
        return "You da man!"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
    
    def reverse_transfer 
      if self.status == "complete"
        @sender.deposit(@amount)
        @receiver.deposit(-(@amount))
        @status = "reversed"
      end 
    end 
  
end
