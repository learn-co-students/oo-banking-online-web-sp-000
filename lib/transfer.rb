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
      if @sender.valid? && @receiver.valid?
        true
      else
        false
      end
    end

    def execute_transaction
      if @sender.balance < @amount || @sender.status == "closed" || @receiver.status == "closed"
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif @status == "pending" && @sender.balance >= @amount
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      end
      # binding.pry
    end

    def reverse_transfer
      if @status == "complete"
        @sender.balance = @sender.balance + @amount
        @receiver.balance = @receiver.balance - @amount
        @status = "reversed"
      end
    end
# binding.pry
end
