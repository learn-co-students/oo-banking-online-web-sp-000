class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if status == 'complete'
      'Transfer has been completed'
    elsif status == 'pending' && valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    elsif sender.close_account
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
      if @status == 'complete'
        receiver.balance -= amount
        sender.balance += amount
        @status = 'reversed'
      end
  end
end
