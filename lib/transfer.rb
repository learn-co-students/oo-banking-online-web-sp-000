require = 'pry'

class Transfer
	attr_accessor :status
	attr_reader :sender, :receiver, :amount
  # your code here
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	# binding.pry
  	@status = 'pending'
  end

  def valid?
  	self.sender.valid? && self.receiver.valid? && self.sender.balance > amount
  end

  def execute_transaction
  	if !self.valid?
  		self.status = 'rejected'
  		return "Transaction rejected. Please check your account balance."
  	end
  	if self.status != 'complete'
	  	self.sender.deposit(-amount)
	  	self.receiver.deposit(amount)
	  	self.status = 'complete'
	  end
  end

  def reverse_transfer
  	# puts "'initially' #{status}"
  	if self.status == 'complete'
  		self.sender.deposit(amount)
	  	self.receiver.deposit(-amount)
  		self.status = 'reversed'
  	end
  	# puts "'finally' #{status}"
  end

end
