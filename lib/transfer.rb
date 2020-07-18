class Transfer

attr_reader :sender, :receiver, :amount
attr_accessor :pending, :status, :transfer_amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end # of initialize


  def valid?
    if @sender.valid? && @sender.balance - @amount >= 0 && @receiver.valid?
      return true
    else
      return false
    end
  end # of valid


  def execute_transaction
    puts "this is sender #{sender.name} #{@sender.balance} #{@sender.status}. v #{@sender.valid?}"
    if !self.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending" && @sender.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end # of conditional
  end # of method

  def reverse_transfer

    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end # ofconditional
  end # of method


end #of class
