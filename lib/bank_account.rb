class BankAccount
# one instance of the class can transfer money to another instance through a Transfer class. 
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        # always initializes with a status of 'open'
    end

    def status
        @status
    end

    def balance
        @balance
    end

    def deposit(amount)
        # can deposit money into its account
        @balance += amount
    end

    def display_balance
        "Your balance is $#{@balance}." 
    end

    def valid?
        if @status == "open" && @balance > 0 
            true
        else 
            false
        end
    end

    def close_account
        @status = "closed"
    end    
end
