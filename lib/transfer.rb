class Transfer
  attr_accessor :sender, :receiver, :status, :amount 
  
 # @@counter = 0
 @@transfers = []
 
 def self.transfers
   @@transfers
 end 
  
  def initialize(sender, receiver, amount)
    @sender = sender  ## sender has to recieve a BankAccount object (it does in the test)
    @receiver = receiver ## send has to recieve a BankAccount object (it does in the test)
    @status = "pending"
    @amount = amount
    @@transfers << self 
  end

  def valid? 
    @sender.valid? && @receiver.valid?
    
    ## the key to writing this method was to understand what the test was doing.  The test is creating variables avi and amanda and initiating new bank accounts with status attributes.  The variables avi and amanda which hold the BankAccount instances are then passed as arguments to initiate a new transfer object.  The test calls avi.valid? avi is assigned to @receiver (aka @receiver.valid?) and calls amanda.valid? amanda is assigned to @sender (aka @sender.valid?).  Both avi and amanda are assigned when the transfer object is initiated. 
    
    ##*Note:  The method initially passed with sender.status and receiver.status probably because the test feeds the correct object e.g. avi, amanda.  The test would probably fail if the test didn't provide the sender and receiver objects directly.
    
    ##**Notes:  The second test for transfer.valid? failed because the variable objects avi and amanda failed to recieve BankAccount.valid?.  Therefore changing @sender.status to @sender.valid? calls the BankAccount.valid? instance method not the transfer instance method.  Same for receiver. Very interesting.  Summary/Generalization:  An class object when passed within a different class object can be references using the difference class object instance variables AND used to call methods from the originating class object. 
  end
  
  def execute_transaction 
    if @sender.balance < @amount                          ## checks senders balance compared to transfer amount and rejects if the balance is lower than the transfer amount 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      
    elsif self.status == "pending"                         ## instance method checks the status before executing the transer. If pending, executes transfer, if completed gives existing balance
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"

      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
    
  end 

end ## end of Transfer class 


=begin ##########################################################################
require 'pry'
describe 'Transfer' do

  let(:avi) { BankAccount.new("Avi") }
  let(:amanda) { BankAccount.new("Amanda") }
  let(:transfer) { Transfer.new(amanda, avi, 50) }
  let(:bad_transfer) { Transfer.new(amanda, avi, 4000) }

  describe '#reverse_transfer' do
    it "can reverse a transfer between two accounts" do
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
      transfer.reverse_transfer
      expect(avi.balance).to eq(1000)
      expect(amanda.balance).to eq(1000)
      expect(transfer.status).to eq("reversed")
    end

    it "it can only reverse executed transfers" do
      transfer.reverse_transfer
      expect(amanda.balance).to eq(1000)
      expect(avi.balance).to eq(1000)
    end
  end



=end ##########################################################################