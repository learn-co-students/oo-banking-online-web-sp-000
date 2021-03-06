class BankAccount
  
  attr_reader :name, :desposit
  attr_accessor :balance, :status
  
  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end
  
  def deposit(deposit)
    @balance += deposit
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    if balance > 0 && status == "open"
      true
    else
      false
    end
  end
  
  def close_account
    @status = "closed"
  end
end


