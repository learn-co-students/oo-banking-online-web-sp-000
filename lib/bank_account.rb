class BankAccount
attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
   "Your balance is $1000."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  
  def close_account
    @status = "closed"
  end

end

