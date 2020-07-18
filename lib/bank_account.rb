class BankAccount
    attr_accessor :status, :balance
    attr_reader :name
    def initialize(account_name)
    @name = account_name
    @balance = 1000
    @status = "open"
    end
    
    def deposit(amount)
      @balance += amount
    end
    
    def display_balance
    "Your balance is $#{self.balance}."
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
