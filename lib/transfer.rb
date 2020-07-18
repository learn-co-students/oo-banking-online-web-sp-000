require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid? #sender and receiver are BankAccount objects
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    message = "Transaction rejected. Please check your account balance."

    if @status == "complete"
      return
    elsif !sender.valid?
      # binding.pry
      @status = "rejected"
      return message
    elsif !receiver.valid?
      # binding.pry
      @status = "rejected"
      return message
    elsif sender.balance < amount
      # binding.pry
      @status = "rejected"
      return message
    else
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end

    def reverse_transfer
      if @status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      else
        return
      end
    end
  end
end
