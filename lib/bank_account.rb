class BankAccount

  attr_accessor :balance, :status, :broke, :closed, :change_name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name.dup.freeze
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

end
