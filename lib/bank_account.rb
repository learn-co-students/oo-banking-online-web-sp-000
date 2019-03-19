class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
  end 
  
  def deposit(amount)
    @balance += amount 
  end 
  
  def withdrawal(amount)
    @balance -= amount
  end 
  
  def display_balance
    "Your balance is $#{@balance}."
  end 
  
  def valid?
    if @balance > 0 && @status == "open"
      true 
    else 
      false 
    end 
  end 
  
  def valid_to_withdraw?(withdrawal)
    if @balance - withdrawal > 0 
      true 
    else 
      false 
    end 
  end 
  
  def close_account
    @status = "closed"
  end 
  
end
