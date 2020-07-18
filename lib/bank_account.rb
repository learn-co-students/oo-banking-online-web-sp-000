class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(balance= 1000, status = "open", name)
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    @balance = @balance + money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
