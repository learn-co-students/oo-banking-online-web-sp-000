class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize (sender, receiver, amount)
    @amount = amount
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    end
    
      def valid?
       if @sender.valid? == true && 
      @receiver.valid? == true && @sender.balance > @amount
     return true 
    else 
     return false
     @status = 'rejected'
    end 
  end
  
  def execute_transaction
      if self.valid? == true && @status == 'pending' && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else 
      @status = 'rejected'
      return 'Transaction rejected. Please check your account balance.'
    end
  end
  
  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end 
  end 
      
  
end
