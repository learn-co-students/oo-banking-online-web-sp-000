class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    transaction
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def transaction
    @transfer = transfer
    @status = 'pending'
  end

  def valid?

  end

  def execute_transaction

  end

  def reverse_transfer

  end

  
end
