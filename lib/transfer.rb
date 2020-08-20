class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount ? true : false
  end

  def execute_transaction
    #we check valid? to make sure sufficient funds
    #we check status not complete to make sure transfer only happen once. must create a new transfer instance to send more money
    if !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else #valid amount, level one passed
      if @status == "complete"
        return #do nothing. end this method
      else #ready to make transaction. both tests passed
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete" #update status to prevent a second execute-transaction
      end
    end
  end


  def reverse_transfer
    if @status != "complete" #only executed transactions (complete) can be reversed
      return
    else #ready to reversed
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end

end
