class BankAccount
  attr_accessor :balance, :Transfer
  attr_reader :name
  
  def initialize(name)
    @balance = 1000
    @status = "open"
    @name = name
  end
  
  def balance
    @balance
  end
  
  def status
    @status
  end
  
  def status=(d_status)
    @status = d_status
  end
  
  def deposit(amount)
    self.balance += amount
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end
  
  def valid?
   @status == "open" && @balance > 0
  end
  
  def close_account
    @status = "closed"
  end
  
end
