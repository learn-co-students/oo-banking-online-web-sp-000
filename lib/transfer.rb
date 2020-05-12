require 'pry'
  class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize (sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"

    end

    def valid?
      sender.valid? && receiver.valid?
    end

    def execute_transaction
      if valid? && sender.balance >= @amount && self.status == "pending"#rejects a transfer if the sender does not have enough funds
        sender.balance -= @amount
        receiver.balance += @amount#can execute a successful transaction between two accounts
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end


    def reverse_transfer
      if valid? && receiver.balance >= @amount && self.status == "complete"#rejects a transfer if the sender does not have enough funds
        sender.balance += @amount
        receiver.balance -= @amount#can execute a successful transaction between two accounts
        self.status = "reversed"
      end
    end

  end
