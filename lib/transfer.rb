


class Transfer

attr_accessor :sender, :receiver, :status, :amount, :reverse_amount
attr_reader 

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = 'pending'
  @amount = amount
  @reverse_amount = amount
end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
    if valid? && sender.balance >= @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = 'complete'
      @amount = 0 
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
end

def reverse_transfer
  if @status == 'complete'
    sender.balance += @reverse_amount
    receiver.balance -= @reverse_amount
    @status = 'reversed'
    @reverse_amount = 0
  end
end
 
end

    