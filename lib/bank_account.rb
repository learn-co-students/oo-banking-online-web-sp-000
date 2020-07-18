class BankAccount

  attr_accessor :balance, :status
  attr_reader :name                        #reader, BankAccount can't change its name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    return "Your balance is $#{self.balance}."    #self here is the instance of whose balance on what object we created in #init (name)
  end

  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    return @status = "closed"
  end
end
