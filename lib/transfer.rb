require 'pry'
class Transfer
attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? == false || @sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif
    @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit (@amount *-1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(@amount *-1)
      @sender.deposit(@amount)
      @status = "reversed"
    else
    end
  end
end
# rspec ./spec/transfer_spec.rb
# rspec --f-f ./spec/transfer_spec.rb
