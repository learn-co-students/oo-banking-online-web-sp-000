require 'pry'
class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name) 
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        self.balance = @balance + amount #adds deposit amount to the original balance
    end

    def display_balance()
        "Your balance is $#{balance}."
        #binding.pry
    end

    def close_account
        self.status = "closed"
    end

    def valid?
        balance > 0 && status == "open"
    end




end
