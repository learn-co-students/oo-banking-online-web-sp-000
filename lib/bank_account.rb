class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(money)
    self.balance + money

  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.balance >0 && self.status =="open"
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end






end
