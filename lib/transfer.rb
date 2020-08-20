class Transfer

  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = "pending"
    @prevSendBal = sender.balance
    @prevRecBal = receiver.balance
  end

  def valid?
    if (@sender.valid? && @receiver.valid?)
      return true
    else
      return false
    end
  end

  def sender
    @sender
  end

  def sender=(input)
    @sender = input
  end

  def receiver
    @receiver
  end

  def status
    @status
  end

  def amount
    @amount
  end

  def execute_transaction
    if (@status != "complete")
      if (self.valid? && (@sender.balance - @amount >= 0))
        @sender.balance=(@sender.balance - @amount)
        @receiver.balance=(@receiver.balance + @amount)
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    else
      return
    end
  end

  def reverse_transfer
    if (@status == "complete")
      @sender.balance = @prevSendBal
      @receiver.balance = @prevRecBal
      @status = "reversed"
    end
  end


end
