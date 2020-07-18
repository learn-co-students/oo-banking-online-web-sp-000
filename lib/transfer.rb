require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(from_account, to_account, amount)
    @sender = from_account
    @receiver = to_account
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    return_value = ""
    if valid?
      if status != "complete"
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      end
    else
      return_value = "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
    return_value
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
