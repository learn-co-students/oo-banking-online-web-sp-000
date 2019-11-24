class BankAccount
  attr_reader :name
  attr_accessor :status, :balance
  
  
  def initialize(acct_name)
  @name = acct_name
  @status = 'open'
  @balance = 1000
end

def  deposit(money)
  @balance = @balance + money
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  if @status == 'open' && @balance > 0
    true
  else
    false
  end
end

def close_account
  @status = 'closed'
end


end

