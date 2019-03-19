class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  def valid? 
    @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
    if self.valid? && @status == "pending" && @sender.valid_to_withdraw?(@amount)
      @receiver.deposit(@amount)
      @sender.withdrawal(@amount)
      @status = 'complete'
    else 
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer 
    if @status == 'complete'
      @receiver.withdrawal(@amount)
      @sender.deposit(@amount)
      @status = 'reversed'
    end 
  end 
  
end
