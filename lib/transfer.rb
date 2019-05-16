
require "./lib/bank_account.rb"
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @last_transfer_amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if !@sender.valid? || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @receiver.deposit(@amount)
      @sender.deposit(@amount * -1)
      @status = "complete"
      @amount = 0
    end
  end

  def reverse_transfer
    if self.status == "complete"
      puts @sender.name
      transfer_back = Transfer.new(@receiver, @sender, @last_transfer_amount)
      transfer_back.execute_transaction()
      @status = "reversed"
    end 
  end

end

