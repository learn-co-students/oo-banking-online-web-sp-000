class BankAccount
  attr_accessor :name, :status, :balance

  def initialize(name)
    @status = "open"
    @balance = 1000 
    @name = name
    #need to raise an exception if name tries to change 
  end
 end 