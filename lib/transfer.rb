class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # are accounts valid?
    if self.valid? && @sender.balance > @amount && @status == "pending"
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      return "Transfer complete. #{@sender.name} successfully sent $#{@amount} to #{@receiver}."
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.valid? && @receiver.balance > @amount && @status == "complete"
      @status = "pending"
      refunder = @receiver
      refundee = @sender
      @sender = refunder
      @receiver = refundee
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "reversed"
    else
      return "Transaction rejected. Please check your account balances and that the accounts are active. Only completed transactions can be reversed."
    end
  end
  
  
end
