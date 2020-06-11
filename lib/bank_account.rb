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

    end
    def display_balance
        "Your balance is $#{@balance}."
    end
    def valid?
        #binding.pry
        if self.status == "closed" 
            false
        elsif self.balance > 0 
            true
        else
            false
        end
    end
    def close_account
        self.status = "closed"
    end
end
