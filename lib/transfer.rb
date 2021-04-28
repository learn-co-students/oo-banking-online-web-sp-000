class Transfer

  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount = 0)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? && self.status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == false
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
    elsif @sender.balance < @amount
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
    else
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status =  "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance = @sender.balance + @amount
    @receiver.balance = @receiver.balance - @amount
    @status = "reversed"
  end
  end


end
