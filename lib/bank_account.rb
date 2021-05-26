require 'pry'
class BankAccount
    # one instance of the class can transfer money to another instance through Transfer class
    # initialize with a name, balance of 1000, status open, can't change name
    attr_accessor :status, :balance
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
        @status == "open" && @balance > 0
    end
    
    def close_account
        @status = "closed"
    end

end
