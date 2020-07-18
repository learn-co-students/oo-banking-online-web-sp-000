class Transfer
    # your code here
    attr_accessor :status, :amount
    attr_reader :sender, :receiver

    @@transaction_hist = []

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      sender.valid? && receiver.valid?
    end

    def execute_transaction
      sender.balance -= @amount

      if valid?
        @@transaction_hist << @amount
        receiver.deposit(@amount)
        @status = "complete"
        @amount = 0
      else
        sender.balance += @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if status == "complete"
        @sender.deposit(@@transaction_hist.last)
        @receiver.balance -= @@transaction_hist.last
        @@transaction_hist.delete(@@transaction_hist.last)
        @status = "reversed"
      end
    end
  end
