class Transfer
  # your code here
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    #valid?
    if sender.balance > amount && status == "pending" && valid?
          sender.balance -= amount
          receiver.balance += amount
          @status = "complete"
    else
          @status = "rejected"
         "Transaction rejected. Please check your account balance."
    end

  end


  def reverse_transfer
    if status == "complete"
      receiver.balance = receiver.balance - amount
      sender.deposit(amount)
      @status = "reversed"
    end
  end


end
#learn spec/transfer_spec.rb
