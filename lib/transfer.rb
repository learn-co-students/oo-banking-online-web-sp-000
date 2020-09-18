require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    #Initializes with a status of pending because we haven't resolved the transfer yet
    #Initializes with sender, receiver, and amount
  end 
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @sender.balance > @amount 
      #Checks that both accounts are valid
      #Calls on the sender and receiver's #Valid? methods
      #Checks that the sender has enough funds THIS WILL BE IMPORTANT LATER
      true
    else 
      false
    end 
  end 

  def execute_transaction
    if self.valid? == true && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      #Execute only if the status is pending
      #Remember == is eq to! = sets the variable!
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      #Otherwise rejected boo
      #THIS IS WHERE THE BALANCE IS IMPORTANT
      #BECAUSE IF THE SENDER DOES NOT HAVE ENOUGH FUNDS TO COMPLETE THE FIRST IF CONDITION
      #YOU WILL BE VERY CONFUSED BY THE ERROR MESSAGE
      #WHICH MORE PROPERLY BELONGS TO THE ABOVE METHOD
      #BUT NO. APPARENTLY IT COMES HERE.
      #Ugh. Anyway, this is why your 'return' wasn't returning and nothing you tried worked.
    end 
  end 

  def reverse_transfer
    if @status == "complete"
      #Checks the status so it only deals with completed transactions
      @sender.balance += @amount
      @receiver.balance -= @amount 
      #Reverses the math
      @status = "reversed"   
      #And boom done
    end 
  end 
end
