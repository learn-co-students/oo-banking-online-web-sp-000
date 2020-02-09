class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(num)
    self.balance += num
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" and self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end

end
