require 'pry'

class Transfer
  
  attr_reader :sender, :receiver, :amount, :status, :code
  @@all = []
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    text_amount = @amount.to_s
    @code = @sender.name + @receiver.name + text_amount
    @@all << self
  end


  def valid?      
    @receiver.valid? && @sender.valid?
  end


  def execute_transaction
    if !@status == "pending" || @@all.each { |tr| tr.code == @code }
      binding.pry
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
    else
      binding.pry
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"  
    end
  end

end


# if @receiver.valid? && @sender.valid?
#   @status = "pending"
#   return true
# else
#   @status="rejected"
#   p "Transaction rejected. Please check your account balance."
# end

