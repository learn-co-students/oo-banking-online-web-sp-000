class BankAccount
attr_reader :name
attr_accessor :balance, :status

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    save
  end

  def save
    @@all << self
  end

  def deposit(value)
    @balance +=value
  end

  def withdrawel(value)
    @balance -=value
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end

    def close_account
      @status = "closed"
    end

end
