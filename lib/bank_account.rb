require 'pry'

class BankAccount
  attr_accessor :balance, :status 
  attr_reader :name


  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    
  end 

  def deposit(amount)
    @balance = @balance + amount
    @balance 
  end 

  def display_balance
    p "Your balance is $#{@balance}."
  end 

  def valid?
    @status == "open" && @balance > 0 
   
  end 

  def close_account 
    @status = "closed"
  end 
 
  def self.balance
    @balance
 
  end 
 
end
