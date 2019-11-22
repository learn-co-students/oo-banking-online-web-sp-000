class Transfer
  attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, amount)
      @sender=sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      if @sender.valid? && @receiver.valid?
        return true
      end
    end

    def execute_transaction
      if self.status == "complete" #this function must come first to prevent repeat transactions
        return "Transaction already completed."

      elsif @sender.valid? && @receiver.valid? == true  && sender.balance > amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"

      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end


    def reverse_transfer
      if @status == "complete"
        @sender.deposit(amount)
        @receiver.deposit(amount * -1)
        @status = "reversed"
      end
    end


end
