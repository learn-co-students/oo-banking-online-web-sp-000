class Transfer
  attr_accessor :sender, :receiver 

  #status = open 
  
  def initialize(sender, receiver)
    @sender = sender
    @receiver = receiver 
  end 
end
