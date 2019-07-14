class BankAccount                 ## creates BankAccount class
  attr_reader :name               ## creates a instance method that allows to read the name instance variable
  attr_accessor :balance, :status  ## creates an instance method that allows read/write of the balance and status instance variable 
  
 # @@accounts = []
  
 # def self.accounts
 #   @@accounts
 # end 
  
  def initialize(name)    ## creates an instance method that when a instance of Bank account certain attributes are created for it, when the new instance of a BankAccount is create an argument of name is required. 
  
    @name = name          ## The instance method takes the argument of name and sets an instance variable
    @balance = 1000       ## sets instance variable to 1000 when a new instance of BankAccount is created
    @status = "open"      ## sets instance variable status to open when a new instance of BankAccount is created 
  #  @@accounts << self    ## stores BankAccount instances in an array 
  end                     ## closes the method
  
  def deposit(deposit_amount)             ## instance method that accepts a deposit_amount as an argument
    @balance = @balance + deposit_amount  ## deposit_amount argument is added to the existing balance and the instance variable @balance is set to the new amount  
  end                                     ## closes deposit instance method
  
  def display_balance                     ## display_balance instance method, no argument is needed because the balance is stored in an instance variable and is accesible to the method despite being ### outside and not passed
  
    "Your balance is $#{@balance}."       ## Returns string with interpolated @balance instance variable 
    
  end                                     ## closed display_balance instance method 
  
 # def self.balance
 #   self.balance
 # end
  
 # def self.status
 #   @status
 # end 
  
  def valid?                          ##  valid? instance method, no argument is need because the variable need are available from outside the method
    @balance > 0 && @status == "open" ## boolean checks if the @balance instance variable is greater than 0 and that the status is equivalent to open. If true the return is true
  end

  
  def close_account     ## close_account instance method, no argument is needed because the instance variables called are available from outside the method 
    @status = "closed"  ## changes the @status instance variable to the string "closed" 
  end
  
#  def name=(name)
#    @name
#  end 

end  ## ends BankAccount class


=begin ######################################################################
  let(:avi) { BankAccount.new("Avi") }

  describe '#close_account' do
    it "can close its account" do
      avi.close_account
      expect(avi.status).to eq("closed")
    end
  end
  
  seth = BankAccount.new("Seth")
  laurie = BankAccount.new("Laurie")
  

=end ######################################################################