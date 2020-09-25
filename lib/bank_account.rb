class BankAccount
  attr_accessor :balance, :status
  attr_reader :name


  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

def deposit(deposit_amount)
  @balance += deposit_amount
end

def display_balance
  return "Your balance is $#{@balance}."
end

def valid?
  if @status == "open" && @balance > 0
    return true
  else return false
  end
  end

  def withdrawal(amount)
   self.balance -= amount
 end

  def close_account
  @status = "closed"
  end

end
