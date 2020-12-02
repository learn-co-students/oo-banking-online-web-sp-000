class BankAccount
attr_reader :name
attr_accessor :balance, :status

@@all = []

def initialize(name, balance=1000, status="open")
  @name=name
  @balance = balance
  @status = status
  @@all << self
end

def self.all
  @@all
end

def deposit(amt)
  @balance += amt
  @balance
end

def display_balance
  return "Your balance is $#{@balance}."
end

def valid?
  if @status == "open" && @balance > 0
    then true
  else false
  end
end

def close_account
  @status = "closed"
  @status
end

end
