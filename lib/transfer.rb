class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid? # Since our 'sender' and 'receiver' attributes are Class instances of 'BankAccount' class, we can use the 'valid?' method on them.
    @sender.valid? && @receiver.valid? ? true : false # We compare to see if both are true.
  end

  def execute_transaction # We first use the method to check and see if our transfer is valid and has a status of 'pending'
    if valid? && @status == 'pending'
      if @sender.balance > amount # We then check to see if the amount the 'sender' is transferring is less than the amount in their balance.
        @sender.balance -= amount # If so, we execute a transfer, removing funds from the sender and giving them to the receiver.
        @receiver.balance += amount # We finish it off by changing our status to 'complete', as to avoid processing the transfer again.
        @status = 'complete'
      else # If the sender is transferring more than their account allows, we reject the transfer.
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    else # If the transfer does not meet one or both of the requirements above in the '&&', we reject the transfer immediately.
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete' # First, we check to see if the transfer status is 'complete'. If not, we know that no transfer took place.
      @sender.balance += amount # After confirming a transfer, we simply reverse the math, returning the sender's funds to their balance.
      @receiver.balance -= amount
      @status = 'reversed' # We update the status with 'reverse'.
    end
  end

end
