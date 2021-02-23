require 'pry'

class BankAccount
  attr_accessor :name, :status, :balance
  
  
    def initialize(name="avi")
    @status = "open"
    @balance = 1000 
   @name = name.freeze
     #begin
    #   if self.name != "avi" 
    # raise FrozenError.new "Frozen name cannot be changed"  
   # rescue 
    #self.name = avi 
        # FrozenError
    end 
  
  
  def deposit(balance)
    deposit = 1000
    binding.pry 
  #     [1] pry(#<BankAccount>)> balance => 1000
  #     [2] pry(#<BankAccount>)> balance + deposit => 2000
  #     [3] pry(#<BankAccount>)> deposit => 1000
  new_balance = balance + deposit  
  end 


def display_balance 
  puts "Your balance is $#{new_balance}."  
end 
end 