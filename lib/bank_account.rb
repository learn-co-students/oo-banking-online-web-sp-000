require"pry"
class BankAccount

attr_reader :name
attr_accessor :balance, :status 

def initialize(name)
@name  = name
@balance = 1000
@status = "open"

end

def name 
  @name
end

def balance=(balance)
   if @balance > 0
     @balance
   else
     @broke = 0
   end
end

def status=(status)
  @status
end

def deposit(deposit)
@balance += (deposit)
  
end

def display_balance 
"Your balance is $#{@balance}."

end

def valid?
 self.status == "open" && self.balance > 0
 
end

def close_account(name)
  self.status = "closed"
end


#binding pry  

end
