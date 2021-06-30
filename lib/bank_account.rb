class BankAccount

attr_reader :name
attr_accessor :balance, :status
  
  @@all = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def deposit(money)
    # Can deposit money into its account
    @balance += money
  end
  
  # Display its balance with a message string
  def display_balance 
    "Your balance is $#{@balance}."
  end

  # Is valid with an open status and a balance greater than 0
  def valid?
    @status == "open" && @balance > 0
  end
  
  # Can close its account
  def close_account
    @status = "closed"
  end
end