class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  def deposit(money)
    # can deposit money into its account
    @balance += money
  end
  def display_balance
    # display its balance
    "Your balance is $#{@balance}."
  end
  def valid?
    # is valid with an open status and a balance greater than 0
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end
  def close_account
    # close its account
    @status = "closed"
  end
end
# Already finished this lesson
