class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name= name
    @balance= 1000
    @status= "open"
  end

  def deposit(money)
    @balance = @balance + money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    return true if @status == "open" && @balance > 0
    return false if @status != "open" || @balance <= 0
  end

  def close_account
    @status= "closed"
  end

end
