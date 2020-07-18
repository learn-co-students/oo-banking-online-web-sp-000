class BankAccount
  
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
  end

  def deposit(deposit_ammount)
    self.balance += deposit_ammount
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end
  
  def valid?
    balance > 0 && status == "open"
  end
  
  def close_account
    self.status = "closed"
  end
  
end
