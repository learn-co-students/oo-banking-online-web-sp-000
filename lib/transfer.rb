class Transfer
  attr_accessor :status
  attr_reader :amount, :receiver, :sender

  def initialize (sender, receiver, amount=0)
    @amount = amount
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @transaction_id = 0
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if !@sender.valid? || @transaction_id > 0 || amount > @sender.balance
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
        @transaction_id = 1
        @receiver.balance += amount
        @sender.balance -= amount
        @status = "complete"
    end
  end

  def reverse_transfer
    if @status==="complete"
      @receiver.balance -= amount
      @sender.balance += amount
      @status = "reversed"
    end
  end

end
