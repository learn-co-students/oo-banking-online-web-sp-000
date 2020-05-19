require 'pry'

class BankAccount

    attr_reader :name
    attr_accessor :status, :balance

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def deposit(amount)
        @balance = @balance + amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
        # binding.pry
    end

    def valid?
        if self.status == 'open' && self.balance > 0
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end
# binding.pry
end
