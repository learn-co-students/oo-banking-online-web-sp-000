class BankAccount

  attr_writer :status
  attr_accessor :balance
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def balance
    @balance
  end
  
  def status 
    @status
  end
  
  def deposit(value)
    @balance += value
  end
  
  def display_balance
    return "Your balance is $#{balance}."
  end
  
  def valid?
    if self.status == "open" && self.balance > 0 
      return true 
    else
      return false 
    end
  end
  
  def close_account
    @status = "closed"
  end
  
end
