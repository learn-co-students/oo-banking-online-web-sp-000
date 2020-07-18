class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name 
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    @balance += amount.to_f
  end

  def display_balance
    balance_display = "Your balance is $#{@balance}."
    balance_display
  end
  
  def valid?
    if @status == 'open' && @balance > 0
      true 
    else
      false 
    end
  end
  
  def close_account
    @status = 'closed'
  end
  
  
end
