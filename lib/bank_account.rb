class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @deposit = []
  end

  # can deposit money into its account
  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  # is valid with an open status and a balance greater than 0
  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end

end
