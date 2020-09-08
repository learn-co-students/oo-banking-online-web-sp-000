class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  
  
  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end
  
  def deposit(deposit)
    @balance += deposit
  end
  
  def valid?
    @balance > 0 && @status == "open" ? true : false
  end
  
  def display_balance
    return "Your balance is $#{@balance}."
  end
  
  def close_account
    self.status = "closed"
  end
  

end
