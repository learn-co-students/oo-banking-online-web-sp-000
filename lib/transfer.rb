require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?  ?  true : false
  end

  def execute_transaction
    if self.valid?
        if @sender.balance < @amount
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        elsif @status == "complete"
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        else
          @sender.balance -= @amount
          @receiver.balance += @amount
          @status = "complete"
        end
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end

=begin
if @sender.balance > @amount && @status == "pending"
  @sender.balance -= @amount
  @receiver.balance += @amount
  @status = "complete"
else
  @status = "rejected"
  return "Transaction rejected. Please check your account balance."
end
=end
