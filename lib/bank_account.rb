class BankAccount
  attr_reader :name
  attr_accessor :status, :balance
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def display_balance
    return "Your balance is $#{@balance}."
  end
  
  def valid?
    return true if @balance > 0 && status == "open"
    false
  end
  
  def close_account
    @status = "closed"
  end
end