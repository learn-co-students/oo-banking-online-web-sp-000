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
    @balance + amount
    
    #binding.pry
  end
  
  def display_balance
    
  end
  
  def valid?
    
  end
  
  def close_account
    
  end
end
