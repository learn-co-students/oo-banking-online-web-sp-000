class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
   def initialize(name)
    @status = "open"
    @name = name
    @balance = 1000
    end

    def deposit(number)
      self.balance = self.balance + number
    end

    def display_balance
      return "Your balance is $#{balance}."
    end

    def close_account
      self.status = "closed"
    end

   def valid?
      if status == "open" && balance >0
        return true
      else
        return false
      end
   end

end
