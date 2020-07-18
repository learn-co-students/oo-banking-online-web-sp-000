class BankAccount


attr_reader :name
attr_accessor :balance, :status, :display_balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end # of initialize

  def deposit(money)
    @balance += money
  end #of deposit

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && status == "open"
      true
    else
      false
    end

  end

  def close_account
    @status = "closed"
  end
end # of class
