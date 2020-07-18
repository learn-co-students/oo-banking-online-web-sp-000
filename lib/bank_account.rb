class BankAccount
  attr_accessor :balance, :status, :deposit
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(deposit_amount)
    @balance += deposit_amount
  end
  
  def display_balance
    #binding.pry
    "Your balance is $#{@balance}."
  end
  
  def valid?
    (status == "open") && (balance > 0)
  end
  
  def close_account
    @status = "closed"
  end
end



