class BankAccount
  attr_accessor :balance,:status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end
  def deposit(number)
    @balance += number
  end
  def display_balance
    "Your balance is $#{@balance}."
  end
  def valid?
     @balance > 0 and @status == "open"
  end
  def close_account
    @status ="closed"
  end
end
