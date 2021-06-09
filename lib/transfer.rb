class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if @sender.balance >= @amount && self.valid?
      if self.status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    else
      nil

    end


  end


end
