class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def name
    @name.dup.freeze
  end

  def deposit(amt)
    @balance += amt
  end

  def withdraw(amt)
    @balance -= amt
  end

  def valid?(amt = 0)
    status == 'open' && balance > amt
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def close_account
    @status = 'closed'
  end
end
