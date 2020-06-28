class Transfer
  attr_accessor :sender,:receiver,:status,:amount
  # your code here
  def initialize(sender,to,amt)
    @sender=sender
    @receiver=to
    @amount=amt
    @status='pending'
  end
  def valid?
    if @sender.valid? and @receiver.valid?
      TRUE
    else
      FALSE
    end
  end
  def execute_transaction
    puts @status
    if @sender.balance<@amount
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.valid? and @status=='pending'
      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status='complete'
    else
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status = "reversed"
    end
  end
end
