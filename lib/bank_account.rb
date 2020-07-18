class BankAccount
  attr_reader :name
  attr_accessor :assets, :balance, :status



  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"

  end

  def balance
    @balance
  end

  def status
    @status
  end

  def deposit(assets)
    @balance += assets
  end

  def display_balance
    "Your balance is $#{@balance}."
  end
  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
end
