class BankAccount
  
  attr_reader :name
  attr_accessor :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(account)
  
  end
  
  def display_balance
  end

  def valid
  end
  
  def close_account
  
  end

end