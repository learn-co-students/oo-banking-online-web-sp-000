class BankAccount

  attr_reader :name
  attr_accessor :balance, :status, :old_balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @old_balance = @balance
    @balance = @balance + amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
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
    @balance = 0
  end


end
