require 'pry'

class Transfer
  attr_accessor :sender, :receiver 

   def initialize(sender, receiver, amount=50)
   @sender = sender
   @receiver = receiver 
   @amount = amount
   @status = "pending"
  end 
 
  def status
   @status
  end 
  
  def amount 
    @amount 
  end 
  
  def valid?
    if (@status == "open" || "pending") && @amount >0 && sender.valid? && receiver.valid?
    true
    else 
     puts "There is a problem with one of the accounts." 
     false 
    end
  end 
  
   
  def execute_transaction
    if sender.balance > amount && valid? && self.status == "pending" 
      sender.balance = sender.balance - amount  
     receiver.balance = receiver.balance + amount 
     @status = "complete"
  else 
     @status = "rejected"
    "Transaction rejected. Please check your account balance." 
  end 
end 
end   
 
  # "each transfer can only happen once" 
  # rejects a transfer if the sender does not have enough funds (does not have a valid account)" do
  #     "Transaction rejected. Please check your account balance."

# pry(#<Transfer>)> @name => nil
    # pry(#<Transfer>)> @amount => 50
    # pry(#<Transfer>)> BankAccount.name => "BankAccount"
    # expect(amanda.balance).to eq(950)
    #   expect(avi.balance).to eq(1050)