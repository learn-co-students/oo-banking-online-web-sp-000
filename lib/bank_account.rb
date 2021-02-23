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
   
  def deposit(deposit)
   current_balance = (balance + deposit) 
  end 
  #but Rspec wants balance to be $2000
  #rspec says wrong number of arguments, but when I run it with no arguments, I get a perpetual loop


def display_balance
  current_balance = balance + deposit
  puts "Your balance is #{$current_balance}." 
end 
# [1] pry(#<BankAccount>)> deposit
# => 1000
# [2] pry(#<BankAccount>)> current_balance = balance + deposit
# => 2000
# [3] pry(#<BankAccount>)> current_balance
# => 2000

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