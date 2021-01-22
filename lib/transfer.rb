class Transfer

  attr_accessor :sender, :receiver, :amount
  attr_reader :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending" && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @status == "complete" || valid? == false || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
    end
  end

end
