require "pry"

class Transfer
  attr_reader  :reciever, :transfer
  attr_accessor :sender

  def initialize (transfer, sender, reciever)
    @sender= sender
    binding.pry
  end

end
