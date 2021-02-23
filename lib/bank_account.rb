require 'pry'

class BankAccount
  attr_accessor  :status, :balance
  @name 
  

    def initialize(name="Avi")
      @name = name 
      @status = "open"
      @balance = 1000
  end

  def name 
    @name 
   end 
   
  def deposit(balance) 
    
    deposit = 1000
  #     [1] pry(#<BankAccount>)> balance => 1000
  #     [2] pry(#<BankAccount>)> balance + deposit => 2000
  #     [3] pry(#<BankAccount>)> deposit => 1000
  balance = (balance + deposit)
  end 


def display_balance
  balance = balance + deposit 
  puts "Your balance is #{$balance}."  
end 


def valid? 
  if status = "open" && balance > 0
  end 
end 
  

# describe '#valid?' do 
#     it "is valid with an open status and a balance greater than 0" do
#       @broke = BankAccount.new("Kat Dennings")
#       @broke.balance = 0
#       @closed = BankAccount.new("Beth Behrs")
#       @closed.status = "closed"
#       expect(avi.valid?).to eq(true)
#       expect(@broke.valid?).to eq(false)
#       expect(@closed.valid?).to eq(false)
#     end 
#   end

end 