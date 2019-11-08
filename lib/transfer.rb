class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end


  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

    if self.valid? && @status == "pending"
      if @sender.balance < self.amount
        @status = "rejected"
      else
        @receiver.deposit(self.amount)
        @sender.deposit(-self.amount)
        @status = "complete"
      end
    else
      #@status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-self.amount)
      @sender.deposit(self.amount)
      @status = "reversed"
    end
  end
end
