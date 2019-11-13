class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = pending
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end
  # your code here
end
