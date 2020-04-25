class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    BankAccount.select {|account| account.name == @receiver} && BankAccount.select {|account| account.name == @sender}
  end
  
  def execute_transaction
    if valid? && @sender >= @amount
      @sender -= @amount
      @receiver += @amount
    else
      "rejected"
    end
  end
  
  def reverse_transfer
    if execute_transaction 
      @sender += @amount
      @receiver -= @amount
    end
  end
  
end
