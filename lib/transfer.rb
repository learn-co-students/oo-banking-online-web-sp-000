class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && status == "pending"
      1.times do
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction #{@status}. Please check your account balance."    
    end  
  end
  
  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
