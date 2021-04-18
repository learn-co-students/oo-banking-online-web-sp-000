class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
  @name = name
  @balance = balance
  @status = status
  end
  def deposit(money)
    self.balance += money.to_i
  end
def withdrawal(amount)
  self.balance -= amount
end
  def display_balance
    "Your balance is $#{@balance}."
  end
  def valid?
    balance > 0 && status == "open"
    #self.status == 'open' && self.balance #? true : false
    #if ((status = "open") == (@balance > 0))
    #true
  #else
    #false
     #is valid with an open status and a balance greater than 0
  #end
end
  def close_account
    #can close its account
    self.status = "closed"
  end
end
