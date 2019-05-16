class BankAccount
  attr_accessor :balance, :status
  attr_reader :name


  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def display_balance
    "Your balance is $#{@balance}."
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

  def deposit(deposit_amount)
    @balance += deposit_amount
  end
end


# b1 = BankAccount.new("Razor")
# puts b1.display_balance()
# b1.deposit(500)
# puts "after deposit #{b1.display_balance()}" 