class BankAccount

  attr_accessor :balance, :status # We create getter and setter methods for these attributes since they will be modified.
  attr_reader :name # Since we do NOT want our name to change once initialized, we just set a reader method.

  def initialize(name) # We initialize our BankAccount with a name, setting our attributes accordingly.
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(money) # Takes the argument of 'money', converts it to an integer, and adds it to our 'balance'.
    self.balance += money.to_i
  end

  def display_balance # Simply outputs a string with our balance attribute inserted inside.
    "Your balance is $#{@balance}."
  end

  def valid? # Checks to see if status and balance meet necessary conditions. If not, it returns false.
    self.status == 'open' && self.balance > 0 ? true : false
  end

  def close_account # Simply updates the status of the Class instance to 'closed'.
    self.status = 'closed'
  end

end
