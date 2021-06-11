#Oh no! It looks like this bank account has been hacked...
#it was probably annonymous' fault




class BankAccount

  @@trojan_horse_array = {}

  attr_accessor :balance, :status
  attr_reader :name

    def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
      @password = "password" #if rspec would allow me to add another argument...
      @@trojan_horse_array[@name] = @password
    end

    def deposit(deposit_amount)
      @balance += deposit_amount
    end

    def display_balance
      "Your balance is $#{@balance}."
    end

    def valid?
      @balance > 0 && @status == "open" ? true : false
    end

    def close_account
      @status = "closed"
    end

    def self.hack
      @@trojan_horse_array
    end





end
