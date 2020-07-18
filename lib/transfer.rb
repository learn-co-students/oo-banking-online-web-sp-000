class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  # can check that both accounts are valid
  # calls on the sender and receiver's #valid? methods
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  # can execute a successful transaction between two accounts
  # each transfer can only happen once
  # rejects a transfer if the sender does not have enough funds (does not have a valid account)
  # def execute_transaction
  #   if @sender.balance < @amount && @sender.close_account == "closed"
  #     @status = "rejected"
  #     "Transaction rejected. Please check your account balance."
  #   elsif @status == "complete"
  #     puts "Transaction has already been executed"
  #   else
  #     @sender.deposit(-@amount)
  #     @receiver.deposit(@amount)
  #     @status = "complete"
  #   end
  # end


  def execute_transaction
    if @status == "complete"
      puts "Transaction has already been executed"
    elsif @sender.balance < @amount || !(@receiver.valid?)
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else @sender.balance > @amount && @receiver.valid?
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end


  # can reverse a transfer between two accounts
  # it can only reverse executed transfers
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end

end
