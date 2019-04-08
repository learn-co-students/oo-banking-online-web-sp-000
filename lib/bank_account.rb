class BankAccount
  attr_reader :name

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

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    #status == "open" && balance > 0 ? true : false
  if @status == "open"
    true
  elsif @balance >= 0
    true
  else
    false
  end
end

end
