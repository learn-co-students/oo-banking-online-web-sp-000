class BankAccount

  attr_accessor :status, :balance, :previous_balance
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @previous_balance = 1000
    @status = "open"
  end
  
  def deposit(amt)
    @previous_balance = @balance
    total = @balance
    total = (total + amt)
    @balance = total
  end
  
  def display_balance
    return "Your balance is $#{@balance}."
  end
  
  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end
  
  def close_account
    @status = "closed"
  end
  
end
