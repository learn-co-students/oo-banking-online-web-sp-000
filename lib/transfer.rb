class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    transaction
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def transaction
    @transfer = transfer
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end


    def execute_transaction
      if @status == "pending" && @sender.balance > @amount && valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

  def reverse_transfer
    if @sender.balance > amount && valid? && @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

  
end
