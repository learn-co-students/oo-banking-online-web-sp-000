class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance= 1000
        @status = "open"
    end

    def deposit(amount_deposited)
        self.balance += amount_deposited       
    end

    def display_balance
        p "Your balance is $#{balance}."
    end

    def valid?
        balance > 0 && status == "open"
    end

    def close_account
        self.status = "closed"
    end

end
