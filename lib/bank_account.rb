class BankAccount
    attr_accessor :account, :balance, :status
    attr_reader :name

    def initialize(name)
        @account = account
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(deposit_amount)
        @balance += deposit_amount
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
