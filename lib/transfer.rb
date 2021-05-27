class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && self.status == 'pending'
      @sender.balance -= amount
      @receiver.balance += amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && self.status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end

end



# @sender.status == 'open' && @sender.balance > 0) && (@receiver.status == 'open' && @receiver.balance > 0) && (self.status == "pending")
# return "Transaction completed." if @status != 'pending'