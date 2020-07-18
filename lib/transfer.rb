require 'pry'

class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor  :status
  
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?      
    @receiver.valid? && @sender.valid? 
  end

  def execute_transaction
     #binding.pry
    if @@all.detect {|t| t.object_id  == self.object_id } 
    puts "first loop, self is #{self}"
    self.status == "rejected"

    elsif !valid? || @sender.balance < @amount
        puts "Second Loop, self id #{self}"
        self.status = "rejected"
        puts "Transaction rejected. Please check your account balance."
      
    else
      puts "First loop else, self is #{self}"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"  
      @@all << self
    end
     return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    #works on executed transfered 
    #reverses the transfer
    # we need to check all records for a completed transaction where 
    # @sender == @reciever && @recever == @Sender && amount === amount
    if self.status == "complete"
      # r_sender = self.receiver
      # r_receiver = self.sender
      # self.sender == r_sender
      # self.receiver == r_receiver
      self.receiver.balance -= amount
      self.sender.balance += amount
     # binding.pry
       self.status = "reversed"
       #@@all.last.status ="reversed"
       ## how to change the status of the transaction in @@all
    end


    #binding.pry
    
  end

end