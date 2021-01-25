class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amt
  end

  def valid?
    sender.valid?(amount) && receiver.valid?
  end

  def execute_transaction
    if valid? && status == 'pending'
      puts "#{valid?}"
      sender.withdraw(amount)
      receiver.deposit(amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer()
    if status == 'complete'
      receiver.withdraw(amount)
      sender.deposit(amount)
      @status = 'reversed'
    end
  end
end
