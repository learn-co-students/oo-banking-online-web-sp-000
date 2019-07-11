class BankAccount

attr_accessor :status, :balance
attr_reader :name

@@accounts = []

def initialize(name)
  @name = name
  @name.freeze
  @status = "open"
  @balance = 1000
  @@accounts << name if !@@accounts.include?(name)
end

def deposit(amount)
  @balance += amount
end
def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  @status == "open" && @balance > 0
end

def close_account
  @status = "closed"
end
def self.accounts
  @@accounts
end

end
