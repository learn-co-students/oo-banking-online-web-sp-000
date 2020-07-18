class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  # initialize BankAccount w/ name, balance = 1000, status = "open"
  # utlizing attr_reader prevents ability to change name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  # deposit money into account
  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  # displays balance
  def display_balance
    "Your balance is $#{balance}."
  end

  # sets account status to "closed"
  def close_account
    self.status = "closed"
  end

  # determines if account is valid (positive balance and "open")
  def valid?
    balance > 0 && status == "open"
  end

end
