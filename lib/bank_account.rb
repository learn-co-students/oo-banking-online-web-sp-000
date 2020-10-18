require 'pry'
class BankAccount
attr_accessor :balance, :status
attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
     @balance = @balance + amount
     @balance
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end

end
# try to create a test that if bankaccount.status == "closed", prevent transfers and deposits
# rspec ./spec/banking_spec.rb
