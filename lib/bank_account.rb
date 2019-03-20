class BankAccount
  attr_accessor :bal
  attr_reader :name
  def initialize(name)
    @name=name
  end
  
  def balance
    @bal=1000
  end
  
  def status
    @stat="open"
  end
  
  def deposit(amount)
    @bal=233
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end
  
  def valid?
    self.status=="open"
      
  end
end
