require 'pry'

class Transfer
  
  attr_reader :sender, :receiver, :amount, :status
  attr_accessor :code
  
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    # text_amount = @amount.to_s
    # @code = @sender.name + text_amount + @receiver.name + @status
    # #@@all << self
  end

  def valid?      
    @receiver.valid? && @sender.valid? 
  end

  def execute_transaction
    binding.pry
    if @@all.detect {|t| t.object_id  == self.object_id } && self.status == "complete"
      if @sender.balance < @amount || @sender.status == 'closed'
        self.status == "rejected"
        #return "Transaction rejected. Please check your account balance."
      end
    else
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"  
      @@all << self
    end
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer

    
  end

end


# if @receiver.valid? && @sender.valid?
#   @status = "pending"
#   return true
# else
#   @status="rejected"
#   p "Transaction rejected. Please check your account balance."
# end

