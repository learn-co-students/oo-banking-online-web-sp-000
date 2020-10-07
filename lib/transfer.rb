class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.balance >= @amount &&
    @sender.valid? &&
    @receiver.valid?
  end

  def execute_transaction
    if valid? && (@status != "complete")
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      # "Transaction rejected. Please check your account balance."
    end
    "Transaction rejected. Please check your account balance." if @status == "rejected"
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = "reversed"
    end
  end

end
