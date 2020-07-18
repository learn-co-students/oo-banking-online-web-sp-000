class Transfer
  # your code here
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance > amount && valid? && status == "pending"
      sender.deposit(-amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if sender.balance> amount && valid? && status == "complete"
      sender.deposit(amount)
      receiver.deposit(-amount)
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejecte. Please check your account balance."
    end
  end

  # Using @status instead of giving it an attr_writer so that the status
  # can only be changed internally
end
