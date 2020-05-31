class BankAccount

attr_accessor :balance, :status
attr_reader :name #can't change its name

def initialize(name) #initialize a bank account with a name
  @name = name
  @balance = 1000 #always inits w a balance of 1000
  @status = "open" #always inits w a status of open
end

def deposit(amount) #can deposit money into account
  @balance += amount
end

def display_balance # can display its balance
  "Your balance is $#{@balance}."
end

def valid? #is valid (t/f &&) with an open status and a balance > 0
  if @status == "open" && @balance > 0
    true
  else
    false
  end
end

def close_account #able to close the account
  @status = "closed"
end

end
