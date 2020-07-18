class Transfer
  # your code here
  attr_accessor :sender, :receiver , :amount, :status
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else false
    end
  end
  def execute_transaction
    if valid? == true && self.status == "pending"
      if @sender.balance < @amount
          "Transaction rejected. Please check your account balance."
      else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  elsif @sender.close_account || @receiver.close_account
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? == true && self.status == "complete"
      if @receiver.balance < @amount
          "Transaction rejected. Please check your account balance."
      else
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
     end
   end
  end

end
