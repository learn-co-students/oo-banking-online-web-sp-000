class Transfer
  # your code here

  attr_accessor :receiver, :sender, :amount, :status

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending" && @sender.balance >= @amount && valid?
    @sender.balance -= @amount
    @receiver.balance +=@amount
    @status = "complete"
else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
  @sender.balance +=@amount
  @receiver.balance -=@amount
  @status = "reversed"
end
end
end
