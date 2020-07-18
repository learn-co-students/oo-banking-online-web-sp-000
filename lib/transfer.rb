require 'pry'
class Transfer < BankAccount

  attr_accessor :sender, :receiver, :status, :balance, :amount


  def initialize(c1, c2, amt)
    @sender = c1
    @receiver = c2
    @status = "pending"
    @balance = balance
    @amount = amt
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
  if valid? && (@sender.balance >= @amount)
     if @status == "pending"
         @sender.balance-=@amount
         @receiver.balance+=@amount
         @status = "complete"
     end
   else
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
 end

  def reverse_transfer
    if @status == "complete"
         @sender.balance+=@amount
         @receiver.balance-=@amount
         @status = "reversed"
    end
end
end
