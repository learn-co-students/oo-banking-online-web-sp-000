require 'pry'

class BankAccount
  attr_accessor  :status, :balance
  

  def initialize(name="Avi")
      @name = name 
      @status = "open"
      @balance = 1000
  end

  def name 
    @name 
   end 
   
  def deposit(entry)
    @balance = (@balance + entry)
  end 

def display_balance
  return "Your balance is $#{@balance}."
end


def valid?
  if @status == "open" && @balance > 0
    return true
  else 
    return false 
    end
   end 
 end 
   