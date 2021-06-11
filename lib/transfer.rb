class Transfer
  # your code here
  #where else would it go??

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

    def initialize(sender, receiver, transfer_amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = transfer_amount
    end

    def valid?
      @sender.valid? && @receiver.valid? ? true : false
    end


    def fund_transfer
      @receiver.balance += @amount
      @sender.balance -= @amount
    end

    def transaction_reverse
      @receiver.balance -= @amount
      @sender.balance += @amount
    end

    def execute_transaction
      if valid? && self.status == "pending" && @sender.balance > @amount
        self.fund_transfer
         self.status = "complete"
      else
        reject_transaction
      end
    end

    def reject_transaction
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
      if valid? && self.status == "complete"
        self.transaction_reverse
        @status = "reversed"
      else
        reject_transaction
      end
    end






end
