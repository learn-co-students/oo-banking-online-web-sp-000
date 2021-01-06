class BankAccount

attr_accessor :balance,:status
attr_reader   :name
def initialize(name)
  @name=name
  @balance=1000
  @status='open'
  
end 

def deposit(money_amount)
   @balance+= money_amount
   end 
   
def display_balance
  
  "Your balance is $#{@balance}."
end 

def valid?
  # if @status=='open' &&  @Balance > 0
     if (@status == "open") && (@balance > 0)
     true 
   else 
     false 
   end 
end 

def close_account
  @status='closed'
end 
end
