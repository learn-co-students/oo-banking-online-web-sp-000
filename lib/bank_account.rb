class BankAccount
  attr_accessor :status
  attr_reader :name, :balance
  
  def intialize(name)
    @name = name
    @balance = 1000
    self.status = "open"
  end
  
  def deposit
    
  end
end
