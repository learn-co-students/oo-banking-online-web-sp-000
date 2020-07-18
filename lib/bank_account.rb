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
       # add the amount to the balance
       @balance += amount 
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end 

    def valid?
        # Returns true with open status && balance > 0
        @status == "open" && balance > 0 ? true : false
    end

    def close_account
        self.status = "closed"
    end
end

