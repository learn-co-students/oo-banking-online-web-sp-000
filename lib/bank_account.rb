class BankAccount
  @@all = []
  @@allOpen = []
  @@allClosed = []
  
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end
  
  def deposit(amount)
    self.balance = self.balance + amount
  end
  
  def display_balance
    return "Your balance is $#{self.balance}."
  end
  
  def valid?()
    self.status == "open" && self.balance > 0
  end
  
  def close_account
    self.status = "closed"
  end
  
end

#  rspec spec/banking_spec.rb
#  rspec spec/transfer_spec.rb