class BankAccount
  attr_reader :name
  attr_accessor :banckaccount, :balance, :status
  
 def initialize(name)
   @name =name 
   @banckaccount = banckaccount
   @balance = 1000
   @status = "open"
  
 end 

def deposit(money_deposited)
@balance += money_deposited
end

def display_balance
     "Your balance is $#{self.balance}."
  end
  
  
  def valid?
    self.balance > 0 && self.status == "open" ? true : false
  end

  def close_account
    self.status = "closed"
end

end 
