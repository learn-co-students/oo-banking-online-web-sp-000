class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money_deposit)
    @balance = @balance + money_deposit
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    self.balance = 0
    self.status = "closed"
  end

end #ClassEnd
