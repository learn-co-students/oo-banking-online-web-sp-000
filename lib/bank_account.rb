class BankAccount
  attr_accessor :status, :balance
  attr_reader :name #should only be allowed to read not write

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(amount)
    @balance += amount
    return @balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @balance > 0 && @status == "open" ?  true : false
  end

  def close_account
    @status = "closed"
  end

end
