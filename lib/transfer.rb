class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    end
  end

    def execute_transaction
      deposit_amount = @amount
      withdrawl_amount = (@amount *-1)
      if sender.balance < deposit_amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif status == "complete"
        "Transaction is already complete!"
      else
        sender.deposit(withdrawl_amount)
        receiver.deposit(deposit_amount)
        @status = "complete"
      end
    end

    def reverse_transfer

        if @status == "complete"
        deposit_amount = @amount
        withdrawl_amount = (@amount *-1)
        receiver.deposit(withdrawl_amount)
        sender.deposit(deposit_amount)
        @status = "reversed"
      else
        "sorry, previous transfer was incomplete!"
      end
    end

end
