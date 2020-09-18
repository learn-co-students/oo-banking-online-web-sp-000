require "pry"
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name 

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"

        #Initializes with a name, a balance, and a status
        #The balance and the status can be overwritten many times
        #The name should only be written at the initialization
        #By assigning that variable to the argument passed in at initialization
        #This is why we give it only an attr-reader
    end 

    def deposit(amount)
        @balance += amount
        #Maths exactly as it says on the tin, balance equals balance plus amount
    end 

    def display_balance
        return "Your balance is $#{@balance.to_s}."
        #Return, not puts. For some reason.
    end 

    def valid? 
        if @status == "open" && @balance > 0
            true
        else
            false
        end 
        #Basic if-then logic
        #Don't forget an eq to is == and a variable set is = 
    end 

    def close_account
        @status = "closed"
        #Reset the status variable
    end 
end
