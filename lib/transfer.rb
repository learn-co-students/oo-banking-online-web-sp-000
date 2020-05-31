#acts as a space for a transaction between two instances of the bank account cass. Can reject instances if the transfer accounts aren't valid or if sender doesn't have the $.
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

#can initialize: Transfer, sender, receiver, status of pending, and transfer amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
end

def valid? #both accounts are valid, calls on sender and receiver #valid? methods
@sender.valid? && receiver.valid? ? true : false
end

def execute_transaction #can execute a successful transaction between two accounts, and can only happen once
   if @sender.balance > @amount && @status == "pending" && valid? #must add the method call for valid? to the if statement to reject a transfer if not a valid acct 
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
   else
     @status = "rejected" #rejects transfer if sender does not have enough funds
     return "Transaction rejected. Please check your account balance."
   end
 end

def reverse_transfer #can reverse a transfer between accounts, can only reverse executed transfers
if @status == "complete"
   @sender.balance += @amount
   @receiver.balance -= @amount
   @status = "reversed"
end
end

end
