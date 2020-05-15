class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end

    def valid?
      if (sender.valid? == true && receiver.valid? == true)
        true
      else
        false
      end    
    end

    def execute_transaction
      if (self.status == "pending" && valid? == true && sender.balance >= self.amount)
        sender.balance = sender.balance - self.amount
        receiver.balance = receiver.balance + self.amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end  
    end

    def reverse_transfer
      if (self.status == "complete")
        receiver.balance = receiver.balance - self.amount
        sender.balance = sender.balance + self.amount
        @status = "reversed"
      end  
    end  
end