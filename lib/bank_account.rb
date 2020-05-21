class BankAccount
  #can't change its name - reader attr
  attr_reader :name

  attr_accessor :balance, :status

  #initializes with a name, $1000, and status of "open"
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  #you can deposit, or add money to your balance
  def deposit(amount)
    @balance += amount
  end

  #Displays the current balance
  def display_balance
    "Your balance is $#{@balance}."
  end

  #if the status is still open and balance is more than 0, then it's still a working bank account
  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  #this is used to close an account
  def close_account
    @status = "closed"
  end
end
