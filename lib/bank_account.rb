require 'pry'

class BankAccount
  attr_accessor :name, :status, :balance

  def initialize(name)
    @status = "open"
    @balance = 1000 
   @name = name.freeze
     #begin
      if self.name != name.freeze 
     raise FrozenError.new "Frozen name cannot be changed" 
   # rescue 
    #avi.name = avi 
        # FrozenError
      end 
    end 
  
  
  def deposit(deposit)
    balance + deposit
 end 


def display_balance 
  puts "Your balance is $#{avi.balance}." 
end 
end 