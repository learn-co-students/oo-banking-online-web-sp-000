class Transfer

  attr_accessor :status, :bankaccount
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    true if sender.valid? && receiver.valid? && (sender.balance >= amount || receiver.balance >= amount)
  end

  def execute_transaction
    if valid?
        sender.deposit(-amount)
        receiver.deposit(amount)
        @status = "complete"
        @amount_last_trans = @amount
        @amount = 0 #to prevent another transfer

    else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @status == "complete"
      #binding.pry
        sender.deposit(@amount_last_trans)
        receiver.deposit(-@amount_last_trans)
        @status = "reversed"
      end
  end
end
