class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(funds)
    @balance += funds
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    @status = "closed"
    @status
  end
end

#  def self.operation1(transfer, amount)
#    bankaccount1= self.new
#    bankaccount2=self.new
#    transfer.transaction_type1(bankacount1, bankaccount2, amount)
#  end
