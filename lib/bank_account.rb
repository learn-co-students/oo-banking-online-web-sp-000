class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    status == 'open' && balance > 0
  end

  def close_account
    self.status = 'closed'
  end

  # wanted to make the attributes balance and status to only be a reader
  # so that we could only change it internally, but the test is hard coding it
  # so I used self on both attributes when changing it.
end
