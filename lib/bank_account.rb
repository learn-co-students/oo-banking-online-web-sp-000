require 'pry'
class BankAccount
  attr_accessor :balance, :status, :amount
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end 
  
  def deposit(amount)
    @balance += amount
    
    #binding.pry
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end
  
  def valid?
   if @staus == "closed" || @balance == 0
     false 
   else
     true 
   end
  end
  
  def close_account
    @status = "closed"
  end
end
