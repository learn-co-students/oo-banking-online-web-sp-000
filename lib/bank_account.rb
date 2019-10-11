require 'pry'
class BankAccount
 #one instance of class can transfer money to another instance thru Transfer class
 attr_accessor :balance, :status
 attr_reader :name

 def initialize(name)
   @name = name
   @balance = 1000
   @status = "open"
 end
 
 def deposit(new_amount)
   @balance = self.balance + new_amount
   @balance
 end
   
  def display_balance
     "Your balance is $#{self.balance}."
  end
  
  def 
end
