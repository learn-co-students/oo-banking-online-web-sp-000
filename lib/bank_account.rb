require 'pry'

class BankAccount

attr_accessor :balance, :status

attr_reader :name

def initialize(name, balance=1000)
  @name=name
  @balance=balance
  @status="open"
end

def deposit(deposit=0)
  deposit+=1-1
  @balance=deposit+balance
end

def display_balance
  @balance=deposit+balance
   "Your balance is $#{@balance}."
end

def valid?
  if @status=="open" && @balance>0
    true
  else status=="closed" && balance=0
    false
  end
end

def close_account
  @status="closed"
end

end
