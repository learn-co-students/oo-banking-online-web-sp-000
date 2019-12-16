# BankAccount class: 

# #initialize: 
# Can initialize a bank account 
# initialize with a name 
# always initializes with a balance of 1000 
# always initializes with a status of 'open' 
# can't change its name 

# #deposit: 
# can deposit money into its account 

# #display_balance: 
# can display its balance 

# #valid: 
# is valid with an open status and a balance greater than 0 

# #close_account:
# can close its account 

class BankAccount
  attr_accessor :balance, :status  
  attr_reader :name 
  
  def initialize(name)
    @name = name 
    @balance = 1000 
    @status = "open" 
  end 
  
  def deposit(money) 
    @balance += money  
  end 
  
  def display_balance
    "Your balance is $#{self.balance}."
  end 
  
  def valid?
    self.balance > 0 && self.status.include?("open") ? true : false 
  end 
  
  def close_account 
    self.status = "closed" 
  end 
  
end

























