

class BankAccount

    attr_accessor :balance, :status, :all, :transfer_log
    attr_reader  :name, :code

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @code = self.object_id
        @@all << self
        @transfer_log = []
    end

    def deposit(amount)
        @balance += amount
        
    end

    def display_balance
        p "Your balance is $#{@balance}."
    end

    def valid?
        @status == "open" && @balance > 0     
    end

    def close_account
        @status = "closed"
    end

    def self.all
        @@all
    end


end
