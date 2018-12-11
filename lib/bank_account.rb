class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  @@all = [ ]
  
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = 'open'
    @@all << self
  end
  
  def deposit(amount)
    @balance = @balance + amount 
  end
  
  def withdraw(amount)
    @balance = @balance - amount
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end 
  
  def valid? 
    if @balance > 0 && @status == 'open'
      true 
    else 
      false
    end
  end 
  
  def close_account
    @status = 'closed' 
  end
  
end
