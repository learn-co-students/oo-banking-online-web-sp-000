#has a name, balance, status
#has many transfers
#instances can transfer from one another
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(money)
        @balance += money
        # add the money to the balance
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @status == "open" && @balance > 0 ? true : false
        # valid if the status is open and the balance is greater than 0
    end

    def close_account
        @status = "closed"
    end
end
