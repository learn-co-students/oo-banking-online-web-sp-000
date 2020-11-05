class BankAccount
  
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    if self.name != name
      raise NoMethodError.new("You cannot change the name")
    end
    
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def display_balance
    p "Your balance is $#{self.balance}."
  end
  
  def valid?
    if balance > 0 && status =="open"
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end

end
