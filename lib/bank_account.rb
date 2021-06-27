class BankAccount
  attr_accessor :balance, :status
  attr_reader :name #can't change its name
  
  def initialize(bank_account) #can initialize a bank account
    @name = bank_account #initializes with a name
    @balance= 1000 #always initializes with a balance of 1000
    @status = "open" #always initializes with a status of open
  end
  
  def deposit(cash) #can deposit money into its account
    @balance += cash
  end
  
  def display_balance #can display its balance
    "Your balance is $#{@balance}."
  end
  
  def valid? #is valid with an open status and balance greater than 0
    if @status == "open" && @balance > 0 
      true 
    else 
      false 
    end
  end
  
  def close_account #can close its account
    @status = "closed"
  end
end
