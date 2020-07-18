class BankAccount
  @@all = []
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" and self.balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end

  def deposit(money)
    self.balance += money
  end


end
