class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end
  
  def deposit(money)
    @balance = @balance + money
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end
  
  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end
  
  def close_account
    @status = "closed"
  end
end
